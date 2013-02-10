class LostController < ApplicationController
  def index
    @lost = Lost.new
  end
end
