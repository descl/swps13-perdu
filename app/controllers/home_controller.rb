require 'twitter'

class HomeController < ApplicationController
  def index
    @feed = Twitter.user_timeline("looozecom")
  end
end
