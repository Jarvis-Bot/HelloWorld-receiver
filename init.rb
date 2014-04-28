class HelloWorld
  def initialize(args)
    @tweet_object = args[:object]
    @twitter_client = Jarvis::ThirdParty::Registered.client(:twitter)
    greet
  end

  def greet
    message = 'Hello sir, what can I do for you?'
    options = { in_reply_to_status_id: @tweet_object.id  }
    @twitter_client.update(message, options)
  end
end
