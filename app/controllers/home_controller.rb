require 'twitter/twitter_service'

class HomeController < ApplicationController
  def index
    @feed = TwitterService.getTweets
  end
end
