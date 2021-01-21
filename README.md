# README



## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|　
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_kana         | string              | null: false             |
| last_kana          | string              | null: false             |
| email              | string              | unique: true            |
| password           | string              | null: false             | 
| birthday           | date                | null: false             |　


### Association

* has_many  :items
* has_many  :purchases


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| seller                              | string     | null: false       |
| category                            | string     | null: false       |
| product condition                   | string     | null: false       |
| shipping charges                    | string     | null: false  　　  | 
| delivery area                       | string     | null: false       |
| estimated shipping dat              | string     | null: false       |
| user                     　　　      | references | foreign_key: true |
| price                     　　　     | string     | null: false       |
| image                               | string     | null: false       |
| item name                　　　      | string     | foreign_key: true |
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
- belongs_to:items
- has_many  :Personal information 

## Personal information table


| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal code                         | Integer    | null: false  　   |
| prefectures                         | string     | null: false 　 　　|　
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |　　　
| building name                       | string     | null: false       |
| phone number                        | Integer    | null: false       |　
| purchase                            | reference  | null: false       |　　　


### Association


- belongs_to :user
- has_many   :Purchase 