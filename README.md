# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_day          | text       | null: false                    |
| item               | references | null: false, foreign_key: true |
| order_record_id    | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :order_records

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| price           | integer    | null: false                    |
| content         | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| condition       | references | null: false, foreign_key: true |
| shipping_option | references | null: false, foreign_key: true |
| prefecture      | references | null: false, foreign_key: true |
| shipping_term   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order_record

## order_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| shipping_info | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_info

## shipping_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | references | null: false, foreign_key: true |
| city          | string     | null: false,                   |
| address       | string     | null: false,                   |
| building_name | string     | null: false,                   |
| phone_number  | integer    | null: false,                   |

### Association

- has_one :order_record