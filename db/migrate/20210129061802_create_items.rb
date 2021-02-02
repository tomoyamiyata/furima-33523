class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references  :user                   ,null: false ,foreign_key: true
      t.string  :image                      , null: false
      t.string  :name                       , null: false
      t.text    :introduction               , null: false
      t.integer :price                      , null: false
      t.integer :product_condition_id       , null: false
      t.integer :shipping_charge_id         , null: false
      t.integer :delivery_area_id           , null: false
      t.integer :estimated_shipping_dat_id  , null: false
      t.integer :category_id                , null: false
      t.timestamps
    end
  end
end  
