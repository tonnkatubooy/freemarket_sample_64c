class CardsController < ApplicationController

  def index
  end

  def new
    @credit = User.new
  end
  
end
