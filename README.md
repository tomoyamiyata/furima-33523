# README



## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|　
| nick_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_kana         | string              | null: false             |
| last_kana          | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |　
| birthday           | date                | null: false             |　


### Association

* has_many  :items
* has_many  :purchases


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| category_id                         | integer    | null: false       |
| product_condition_id                | integer    | null: false       |
| shipping_charge_id                  | integer    | null: false  　　  | 
| delivery_area_id                    | integer    | null: false       |
| estimated_shipping dat_id           | integer    | null: false       |
| user                     　　　      | reference  | foreign_key: true |
| price                     　　　     | string     | null: false       |
| name                     　　　      | string     | null: false       |
| info                      　　　     | text       | null: false       |


### Association
- belongs_to :user
- has_one    :purchase

## Purchase　table

| Column      | Type      | Options           |
|-------------|-----------|-------------------|
| item        | reference | foreign_key: true |
| user        | reference | foreign_key: true |

### Association

- has_many  :user
- has_one :street address


## street address table


| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| delivery_area_id                    | integer    | null: false       |
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |　　　
| building_name                       | string     |                   |
| phone_number                        | string     | null: false       |　
| purchase                            | reference  | null: false       |　　　


### Association

- belongs_to :purchase 