require './lib/twitter/twitter_service'

ts=TwitterService.new

ts.tweet "test without photo"
ts.tweet "test with photo", File.new('test/LostWallet.jpg')