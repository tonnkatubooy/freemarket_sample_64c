class ItemsController < ApplicationController
  def index
    @items = Item.includes(:pictures).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.pictures.new
    #respond_to do |format|
      #format.html
      #format.json
    #end
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
    params.require(:item).permit(:item_name, :price,:discription,:category,:brand_id,:status_id,:delivery_charge_id,:area_id,:shipping_date_id,:shipping_method_id,pictures_attributes:{images: []}).merge(user_id: current_user.id)
  end
  
end
