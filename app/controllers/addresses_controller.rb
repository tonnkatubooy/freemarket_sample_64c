class AddressesController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(current_user), notice: '変更出来ました'
    else
      render :new, alert: '変更出来ませんでした'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @address = Address.find_by(user_id: current_user.id)
  end

  def update
    @address = Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      redirect_to user_path(current_user), notice: '変更出来ました'
    else
      render :new, alert: '変更出来ませんでした'
    end
  end

  private

  def address_params
    params.require(:address).permit(:destination_last_name, :destination_first_name, :destination_last_name_kana, :destination_first_name_kana, :post_number, :prefecture, :city, :house_number, :building, :destination_phone_number).merge(user_id: current_user.id)
  end

end