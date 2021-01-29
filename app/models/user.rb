class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
        
    with_options presence: true do
          validates :birthday
          validates :nick_name
      with_options format:{with: /\A[ぁ-んァ-ン一-龥]/ } do# ここがユーザー本名全角の正規表現
          validates :first_name
          validates :last_name 
      end  
      with_options format:{with: /\A[ァ-ヶー－]+\z/ } do # ここがフリガナ全角の正規表現
          validates :first_kana
          validates :last_kana
          validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "英数字文字6以上"}
      end    

          
    end

       

         

     
         
        
    
end
