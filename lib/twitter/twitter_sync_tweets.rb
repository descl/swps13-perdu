require 'httpclient'
require 'rest_client'
require 'json'
require 'pp'

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
        picture_url = tweet["entities"]["media"][0]["media_url"] if tweet["entities"].has_key?("media")

        puts "posting new tweet to loooze.com ..."
        begin
          response=RestClient.post 'http://www.loooze.com/objet/', :name => name, :picture => picture_url #, :user_name => user_name,
          if response.code >= 300
            puts "HTTP error occurred - code: #{response.code}"
            return
          end
        rescue Exception => e
          puts "Unexpected error occurred: #{e.inspect}"
          return
        end
        puts "post finished successfully."

        max_twitter_id=tweet["id"]

        File.open(file_name, 'w') {|file| file.write(max_twitter_id) }
      end

      puts "sync finished."

      puts "sleep 30 sec ..."
      sleep(30)
    end
  end
end