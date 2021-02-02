require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end
      it 'introductionが空だと出品できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'product_conditionが未選択だと出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition Select")
      end
      it 'estimated_shipping_datが未選択だと出品できない' do
        @item.estimated_shipping_dat_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping dat Select")
      end
      it 'delivery_areaが未選択だと出品できない' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area Select")
      end
      it 'shipping_chargeが未選択だと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge Select")
      end
      it 'priceが空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが¥300以下の場合登録できないこと' do
      @item.price = "50"
      @item.valid?
      expect(@item.errors[:price]).to include("Out of setting range")
      end
      it 'priceが¥9999999以上の場合登録できないこと' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting range")
      end
      it 'priceは半角英数混合では登録できないこと' do
        @item.price = "123aa"
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting range")
      end
      it 'priceは半角英語だけでは登録できないこと' do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting range")
      end
    end
  end
end