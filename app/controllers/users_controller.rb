class UsersController < ApplicationController

  require "payjp"

  def show
    @user = User.find(params[:id])
    @address = Address.select(:user_id)
    @card =Card.find_by(user_id: current_user.id)
  end
    
end
