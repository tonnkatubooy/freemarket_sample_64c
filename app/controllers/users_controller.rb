class UsersController < ApplicationController


  def edit
    user = User.find(params[:id])
    @image = user.image
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @address = Address.select(:user_id)
  end

  def create
    @user = User.new(post_params)
  end


  private

  def user_params
    params.require(:user).permit(:image)
  end

end
