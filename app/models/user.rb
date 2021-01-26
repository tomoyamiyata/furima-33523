class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         validates :birthday, presence: true 
         validates :nick_name, presence: true
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
         validates :last_name, presence: true, format:    {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現 
         validates :first_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
         validates :last_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
         
        

         

         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX }

end
