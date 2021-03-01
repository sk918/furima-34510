# テーブル設計

## users テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| password          | string | null: false               |
| family_name       | string | null: false               |
| first_name        | string | null: false               |
| family_name_kana  | string | null: false               |
| first_name_kana   | string | null: false               |
| birth_year        | string | null: false               |
| birth_month       | string | null: false               |
| birth_day         | string | null: false               |


### Association

- has_many :items
- has_many :purchased-items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | text       | null: false                    |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| category        | text       | null: false                    |
| status          | text       | null: false                    |
| delivery_cost   | text       | null: false                    |
| delivery_area   | text       | null: false                    |
| delivery_period | text       | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchased-item

## purchased-items テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| state        | string     | null: false                    |
| city         | string     | null: false                    |
| adress1      | string     | null: false                    |
| adress2      | string     |                                |
| phone_number | integer    | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

