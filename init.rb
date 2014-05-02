class HelloWorld
  def initialize(args)
    @tweet_object = args[:object]
    @twitter_client = Jarvis::ThirdParty::Registered.client(:twitter)
    greet if @tweet_object.is_a? Twitter::Tweet
  end

  def greet
    message = 'Hello sir, what can I do for you?'
    options = { in_reply_to_status: @tweet_object  }
    @twitter_client.update("@#{@tweet_object.user.screen_name} #{message}", options)
  end
end
