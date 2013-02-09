require 'httpclient'
require 'json'
require 'pp'

class TwitterSyncTweets
  def initialize

    launch
  end

  def launch
    http = HTTPClient.new
    file=File.open("max_twitter_id.txt", 'r')
    max_twitter_id=file.read.to_i
    file.close

    while true do
      puts "Starting sync ..."
      response = http.get "http://search.twitter.com/search.json?q=%23loooze&include_entities=true&since_id=#{max_twitter_id}"
      tweets = JSON.parse(response.content)["results"]

      tweets.each do |tweet|
        next if tweet["from_user"]="looozecom"

        puts "new tweet: #{tweet["text"]}"

        objet=Objets.new
        objet.text=tweet["text"]
        objet.save
        if tweet.id > max_twitter_id
          max_twitter_id=tweet.id
        end
      end
      file=File.open("max_twitter_id.txt", 'w')
      file.write(max_twitter_id)
      file.close

      puts "sync finished."

      sleep(30)
    end
  end
end