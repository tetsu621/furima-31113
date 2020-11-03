# README

## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |

### Association
- has_many :products
- has_many :purchases

## productsテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| title    | string  | null: false |
| category | string  | null: false |
| seller   | text    | null: false |
| price    | text    | null: false |
| user     | string  | null: false |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| buyer            | text       | null: false       |
| shipping_address | text       | null: false       |
| user             | references | foreign_key: true |
| products         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
