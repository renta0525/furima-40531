# テーブル設計

## users テーブル (ユーザー情報)　

| Column             | Type   | Options                                |
| ------------------ | ------ | -------------------------------------- |
| nickname           | string | null: false                            |
| email              | string | null: false, unique: true, default: "" |
| encrypted_password | string | null: false, default: ""               |
| first_name         | string | null: false                            |
| last_name          | string | null: false                            |
| first_name_read    | string | null: false                            |
| last_name_read     | string | null: false                            |
| birthday           | date   | null: false                            |
##　devise実装

### Association
has_many :items
has_many :orders


## items テーブル (商品情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| contribution_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
##　imageはActiveStorageで実装

### Association
belongs_to :user
has_one :order


## orders テーブル (購入記録)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :address


## addresses テーブル (購入者情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| post_cord          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |


### Association
belongs_to :order

