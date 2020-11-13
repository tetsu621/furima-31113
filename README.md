# README

## usersテーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |


### Association
- has_many :products
- has_many :purchases

## productsテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| title           | string     | null: false       |
| explanation     | text       | null: false       |
| category_id     | integer    | null: false       |
| status_id       | integer    | null: false       |
| delivery_fee_id | integer    | null: false       |
| area_id         | integer    | null: false       |
| days_id         | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## ordersテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association
- belongs_to :purchase

