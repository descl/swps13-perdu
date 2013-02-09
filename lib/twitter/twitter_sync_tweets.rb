require 'httpclient'
require 'rest_client'
require 'json'
require 'pp'
require 'open-uri'

class TwitterSyncTweets
  def initialize

    launch
  end

  def launch
    http = HTTPClient.new

    file_name="#{File.dirname(__FILE__)}/max_twitter_id.txt"

    max_twitter_id=0

    File.open(file_name, 'r') {|file| max_twitter_id=file.read.to_i}

    while true do
      search_url= "http://search.twitter.com/search.json?q=%23loooze&include_entities=true&since_id=#{max_twitter_id}"
      puts "Starting sync ... (url: #{search_url})"

      response = http.get search_url
      tweets = JSON.parse(response.content)["results"]

      tweets.sort_by! {|tweet| tweet["id"].to_i}

      tweets.each do |tweet|
        next if tweet["from_user"]=="looozecom"

        puts "new tweet: #{tweet["text"]}"
        pp tweet

        user_name = tweet["from_user"]
        name = tweet["text"]
        if tweet["entities"].has_key?("media")
          picture_url = tweet["entities"]["media"][0]["media_url"]

          open('image.png', 'wb') do |file|
            file << open(picture_url).read
          end
        end

        puts "posting new tweet to loooze.com using curl ..."
        curl_command="curl -F \"objet[name]=#{name}\"" + (picture_url ? " -F \"objet[picture]=@image.png\"" : "") + " \"http://www.loooze.com/objets\""
        puts curl_command
        system(curl_command)

        puts "post finished successfully."

        max_twitter_id=tweet["id"]

        File.open(file_name, 'w') {|file| file.write(max_twitter_id) }
        puts "set max twitter id to #{max_twitter_id}"
      end

      puts "sync finished."

      puts "sleep 10 sec ..."
      sleep(30)
    end
  end
end