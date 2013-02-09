class FoundController < ApplicationController
  def index
    @objet = Objet.new
  end
end
