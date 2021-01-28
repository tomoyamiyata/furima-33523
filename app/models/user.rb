class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
        
        with_options presence: true do
          validates :birthday
          validates :nick_name
          validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
          validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現 
          validates :first_kana, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
          validates :last_kana, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
          validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "英数字文字6以上"}
          

          
        end

        #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          #validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

         

     
         
        
    
end
