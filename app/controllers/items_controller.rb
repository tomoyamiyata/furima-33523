class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   #@item = Item.find(params[:id]).includes(:user)
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :product_condition_id, :shipping_charge_id, :delivery_area_id, :estimated_shipping_dat_id, :category_id, :image).merge(user_id: current_user.id)
  end

end