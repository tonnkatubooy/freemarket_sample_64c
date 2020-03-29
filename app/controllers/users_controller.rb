class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @address = Address.select(:user_id)
  end

end
