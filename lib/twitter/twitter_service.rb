require 'twitter'

class TwitterService
  def initialize
    Twitter.configure do |config|
      config.consumer_key = "Svb6fjEXsZ1Dp3zK2VlnVg"
      config.consumer_secret = "v8FTgkBOMqRl3d0cIjlYSKZQk8ShIf44KI5nwiLos"
      config.oauth_token = "1162309688-TtQg3IdDfeSMsPptLpKZFubVj8J5o5pKtLWC5rb"
      config.oauth_token_secret = "RWqBJUJV4ejOAVU0gLhwr1qdjeRDoWEWIZXMnsGJuy8"
    end
  end

  def tweet
    Twitter.update("Test tweet")
  end
end