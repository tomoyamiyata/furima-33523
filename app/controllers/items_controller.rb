class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, except: [:index, :show]
  
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
     @item = Item.find(params[:id])
     
  end

  def edit
    @item = Item.find(params[:id])
    if  current_user.id != @item.user_id 
      redirect_to item_path(@item)
    end
     
  end
  
  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :product_condition_id, :shipping_charge_id, :delivery_area_id, :estimated_shipping_dat_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end