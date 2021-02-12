require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    sleep (0.5)
  end
  
  
  describe '#create' do
    context '購入ができる場合' do
  
      it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
      end
    


      it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
      end
      it "tokenがあれば保存ができること" do
      expect(@order_address).to be_valid
      end
    end  

  
    context '購入ができない場合' do


      it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'delivery_area_idを選択していないと保存できないこと' do
      @order_address.delivery_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityは空だと保存できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
      end



      it 'アイテムIDがなければ登録できないこと' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'ユーザーIDがなければ登録できないこと' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenがなければ登録できないこと' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end


      
    end
  end
end