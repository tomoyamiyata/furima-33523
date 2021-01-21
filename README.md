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
| password           | string              | null: false             | 
| encrypted_password | string              | null: false             |　
| birthday           | date                | null: false             |　


### Association

* has_many  :items
* has_many  :purchases


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| seller                              | string     | null: false       |
| category                            | string     | null: false       |
| product condition_id                | integer    | null: false       |
| shipping charge_id                  | integer    | null: false  　　  | 
| delivery area_id                    | integer    | null: false       |
| estimated shipping dat_id           | integer    | null: false       |
| user                     　　　      | references | foreign_key: true |
| price                     　　　     | string     | null: false       |
| item name                　　　      | string     | null: false       |
| item text                 　　　     | text       | null: false       |


### Association
- belongs_to :user
- has_one    :purchase

## Purchase　table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- has_many  :user
- has_one :street address


## street address table


| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal code_id                      | integer    | null: false       |
| prefectures                         | string     | null: false 　 　　|　
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |　　　
| building name                       | string     | null: false       |
| phone number                        | Integer    | null: false       |　
| purchase                            | reference  | null: false       |　　　


### Association


- belongs_to :user 
- belongs_to :Purchase 