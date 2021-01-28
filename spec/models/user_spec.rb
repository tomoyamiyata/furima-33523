require 'rails_helper'

RSpec.describe User, type: :model do


  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    context '新規登録ができる場合' do
      # 入力されている場合のテスト ▼
      it "全ての項目の入力が存在すれば登録できること" do
        
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      # nul:false, presence: true のテスト ▼
      it "nick_nameがない場合は登録できないこと" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors[:nick_name]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = "" 

        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it 'パスワードが半角数字のみでは登録できないこと' do
        @user.password = "222222"
        @user.valid?
        expect(@user.errors[:password]).to include("英数字文字6以上")
      end

      it 'パスワードが半角英字のみでは登録できないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors[:password]).to include("英数字文字6以上")
      end
      it 'パスワードが全角文字では登録できないこと' do
        @user.password = "AAAAAA"
        @user.valid?
        expect(@user.errors[:password]).to include("英数字文字6以上")
      end



      it "password_confirmatinがない場合は登録できないこと" do
        @user.password_confirmation = ""
       
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = "" 
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it "first_kanaがない場合は登録できないこと" do
        @user.first_kana = "" 
        #binding.pry
        @user.valid?
        expect(@user.errors[:first_kana]).to include("can't be blank")
      end

      it "last_nameがない場合は登録できないこと" do
        @user.last_name = "" 
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it "last__kanaがない場合は登録できないこと" do
        @user.last_kana = "" 
        @user.valid?
        expect(@user.errors[:last_kana]).to include("can't be blank")
      end

      it "birth_dayがない場合は登録できないこと" do
        @user.birthday = "" 
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end

      # パスワードの文字数テスト ▼

      it "passwordが6文字以上であれば登録できること" do
        @user.password = "1234mt"
        @user.password_confirmation = "1234mt"
        expect(@user).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "123mt"
        @user.password_confirmation ="123mt"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        @user = create(:user)
        another_user = build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "emailに@がない場合は登録できないこと " do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもpasswordがない場合は登録できないこと" do
        @user.password = "" 
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank", "can't be blank")
      end

      # 本人確認名前全角入力のテスト ▼

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = "ｱｲｳｴｵ" 
        @user.valid?
        expect(@user.errors[:first_name]).to include("is invalid")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors[:last_name]).to include("is invalid")
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'first_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_kana =  "あいうえお"
        @user.valid?
        expect(@user.errors[:first_kana]).to include("is invalid")
      end

      it 'last_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_kana = "あいうえお"
        @user.valid?
        expect(@user.errors[:last_kana]).to include("is invalid")
      end
    end
  end
end
