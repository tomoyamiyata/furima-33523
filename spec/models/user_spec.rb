require 'rails_helper'

RSpec.describe User, type: :model do


  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    context '新規登録ができる場合' do
      # 入力されている場合のテスト ▼
      it "全ての項目の入力が存在すれば登録できること" do
        
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      # nul:false, presence: true のテスト ▼
      it "nicknameがない場合は登録できないこと" do
        user = build(:user, nick_name: nil)
        user.valid?
        expect(user.errors[:nick_name]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "family_nameがない場合は登録できないこと" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "family_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_kana: nil)
        user.valid?
        expect(user.errors[:first_kana]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_kana: nil)
        user.valid?
        expect(user.errors[:last_kana]).to include("can't be blank")
      end

      it "birth_dayがない場合は登録できないこと" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("can't be blank")
      end

      # パスワードの文字数テスト ▼

      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "123456", password: "123456")
        expect(user).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        user = build(:user, password: "123mt", password: "123mt")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもpasswordがない場合は登録できないこと" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank", "can't be blank")
      end

      # 本人確認名前全角入力のテスト ▼

      it 'family_nameが全角入力でなければ登録できないこと' do
        user = build(:user, first_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:first_name]).to include("is invalid")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = build(:user, last_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:last_name]).to include("is invalid")
      end

      # 本人確認カタカナ全角入力のテスト ▼

      it 'first_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, first_kana: "あいうえお")
        user.valid?
        expect(user.errors[:first_kana]).to include("is invalid")
      end

      it 'last_kanaが全角カタカナでなければ登録できないこと' do
        user = build(:user, last_kana: "あいうえお")
        user.valid?
        expect(user.errors[:last_kana]).to include("is invalid")
      end
    end
  end
end
