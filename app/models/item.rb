class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :estimated_shipping_dat
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    with_options format:{with: /\A[0-9]+\z/ } do# ここがpriceの半角数字の正規表現
    validates :price  
    end
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :product_condition_id, numericality: { other_than: 1, message: "Select" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "Select" }
  validates :delivery_area_id, numericality: { other_than: 0, message: "Select" }
  validates :estimated_shipping_dat_id , numericality: { other_than: 1, message: "Select" }
  validates :category_id, numericality: { other_than: 1, message: "Select" }

end
