class PurchaseController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(purchase_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to  root_path
    else
      render action: :index
    end
  end
  private

  def purchase_params
    params.require(:order_address).permit(:postal_code,:delivery_area_id,:city,:address,:building_name,:phone_number,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: purchase_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end
    
end  


