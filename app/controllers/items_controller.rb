class ItemsController < ApplicationController
  def index
    @items = Item.includes(:pictures).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.pictures.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    binding.pry
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
  end
  
  def purchase
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:price,:discription,:status_id,:delivery_charge_id,:area_id,:shipping_date_id,:shipping_method_id,pictures_attributes:{image: []}).merge(user_id: current_user.id)
    #実装完了まで外してます :category,:brand_id,
  end
  
end
