class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id,:city ,:address, :building_name, :phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number,format: {with: /\A\d{11}\z/ , message: "is invalid."}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase =  Purchase.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, delivery_area_id:delivery_area_id, city:city, address:address, building_name:building_name ,phone_number:phone_number, purchase_id: purchase.id)
  end
end