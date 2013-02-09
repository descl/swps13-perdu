require 'tweetstream'

class TwitterStreamingService
  def initialize
    TweetStream.configure do |config|
      config.consumer_key = "Svb6fjEXsZ1Dp3zK2VlnVg"
      config.consumer_secret = "v8FTgkBOMqRl3d0cIjlYSKZQk8ShIf44KI5nwiLos"
      config.oauth_token = "1162309688-TtQg3IdDfeSMsPptLpKZFubVj8J5o5pKtLWC5rb"
      config.oauth_token_secret = "RWqBJUJV4ejOAVU0gLhwr1qdjeRDoWEWIZXMnsGJuy8"
      config.auth_method = :oauth
    end

    launch
  end

  def launch
    puts "Launching Twitter streaming ..."
    TweetStream::Client.new.on_anything do |status|
      # puts "on_anything: #{status[0..50]}"
    end.on_error do |message|
      puts "on_error: #{message}"
    end.track('#loooze') do |status|
      puts "track: #{status.text}"
    end
    puts "Launched Twitter streaming."
  end
end