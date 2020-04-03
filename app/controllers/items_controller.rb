class ItemsController < ApplicationController
  def index
    @items = Item.includes(:pictures).order('created_at DESC')
  end

  def new
    @item = Item.new
    @picture=@item.pictures.new

  end

  def create
    @item = Item.new(item_params)
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
    params.require(:item).permit(:item_name,:price,:description,:user,:category,:brand,:status_id,:delivery_charge_id,:area,:shipping_date_id,:shipping_method_id)
  end
  #pictures_attributes: [:image],を追加する
  
end
