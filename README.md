# README

## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| birthday  | string | null: false |


### Association
- has_many :products
- has_many :purchases

## productsテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| title           | string  | null: false |
| explanation     | text    | null: false |
| category_id     | integer | null: false |
| status_id       | integer | null: false |
| delivery_fee_id | integer | null: false |
| area_id         | integer | null: false |
| days_id         | integer | null: false |
| price           | text    | null: false |
| user            | string  | null: false |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user             | references | foreign_key: true |
| products         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :address

## addressesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefectures_id   | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| cellphone_number | string     | null: false       |
| purchase         | references | foreign_key: true |

### Association
- belongs_to :purchase

