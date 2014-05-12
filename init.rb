class HelloWorld
  def initialize(args)
    @tweet_object = args[:object]
    @twitter_client = Jarvis::API::Addons.client(:twitter)
    greet if match_hello? @tweet_object.text
  end

  def greet
    message = 'Hello sir, what can I do for you?'
    if @tweet_object.is_a? Twitter::Tweet
      options = { in_reply_to_status: @tweet_object  }
      @twitter_client.update("@#{@tweet_object.user.screen_name} #{message}", options)
    elsif @tweet_object.is_a? Twitter::DirectMessage
      user = @tweet_object.sender.id
      @twitter_client.create_direct_message(user, message)
    end
  end

  def match_hello?(text)
    text.match(/\b(hello|hi|bonjour|hola|yo)\b/i)
  end
end
