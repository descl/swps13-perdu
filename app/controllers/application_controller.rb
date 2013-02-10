class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_vars
  def set_vars
    @feed = Twitter.user_timeline("looozecom")
  end
end
