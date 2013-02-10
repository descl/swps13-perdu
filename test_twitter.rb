require './lib/twitter/twitter_service'

ts=TwitterService.new

ts.tweet "I found a wallet #loooze", File.new('test/LostWallet.jpg')
puts "tweet sent!"
