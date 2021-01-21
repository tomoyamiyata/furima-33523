# README



## users_table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|　
| nick_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_kana         | string              | null: false             |
| last_kana          | string              | null: false             |
| email              | string              | unique: true,null: false|
| encrypted_password | string              | null: false             |　
| birthday           | date                | null: false             |　


### Association

* has_many  :items
* has_many  :purchases


## items_table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| category_id                         | integer    | null: false       |
| product_condition_id                | integer    | null: false       |
| shipping_charge_id                  | integer    | null: false  　　  | 
| delivery_area_id                    | integer    | null: false       |
| estimated_shipping dat_id           | integer    | null: false       |
| user                     　　　      | reference  | foreign_key: true |
| price                     　　　     | integer    | null: false       |
| name                     　　　      | string     | null: false       |
| info                      　　　     | text       | null: false       |


### Association
- belongs_to :user
- has_one    :purchase

## Purchase_table

| Column      | Type      | Options           |
|-------------|-----------|-------------------|
| item        | reference | foreign_key: true |
| user        | reference | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :street_address


## street_address_table


| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code       　　　　           | string     | null: false       |
| delivery_area_id                    | integer    | null: false       |
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |　　　
| building_name                       | string     |                   |
| phone_number                        | string     | null: false       |　
| purchase                            | reference  | null: false       |　　　


### Association

- belongs_to :purchase 