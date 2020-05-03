class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @address = Address.select(:user_id)
    card = Card.where(user_id: current_user.id)
  end

end
