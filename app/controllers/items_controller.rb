class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
     
  end

  def edit
    if  current_user.id != @item.user_id 
      redirect_to root_path(@item)
    end
     
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
  @item.destroy
  redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

end