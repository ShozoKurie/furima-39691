## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname          | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | ------------------------------- |
| item_name          | string    | null: false                     |
| caption            | text      | null: false                     |
| category_id        | integer   | null: false                     |
| condition_id       | integer   | null: false                     |
| postage_id         | integer   | null: false                     |
| region_id          | integer   | null: false                     |
| days_to_ship_id    | integer   | null: false                     |
| price              | integer   | null: false                     |
| user               | references| null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :purchase

## destinations テーブル
| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| post_code          | string     | null: false                     |
| region_id          | integer    | null: false                     |
| city               | string     | null: false                     |
| street_address     | string     | null: false                     |
| building           | string     |                                 |
| phone_number       | string     | null: false                     |
| purchase           | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase

## purchases テーブル
| user         | references | null: false, foreign_key: true  |
| item         | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination