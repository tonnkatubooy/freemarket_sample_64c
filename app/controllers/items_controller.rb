class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.pictures.new
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
    params.require(:item).permit(:item_name,:price,:description,:user,:category,:brand,:status,:delevery_charge,:area,:shipping_date,:shipping_method)
  end
  #pictures_attributes: [:image],を追加する
  
end
