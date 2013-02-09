require './lib/twitter/twitter_service'

ts=TwitterService.new

(1 .. 100).each do |n|
  puts n
  ts.tweet "I found a wallet #{n} #loooze", File.new('test/LostWallet.jpg')
end
