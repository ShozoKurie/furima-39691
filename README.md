## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | integer| null: false               |

### Association

- has_many :items
- has_many :destinations

## items テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| item_name          | string | null: false               |
| caption            | string | null: false               |
| category           | integer| null: false               |
| condition          | integer| null: false               |
| postage            | integer| null: false               |
| region             | integer| null: false               |
| days_to_ship       | integer| null: false               |
| user_id            | integer| null: false               |
| photo_id           | integer| null: false               |
| destination_id     | integer|                           |
| sold_out           | integer| null: false               |



### Association

- belongs_to :user
- has_one :destination

## destinations テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| post_code          | integer| null: false               |
| prefecture         | integer| null: false               |
| city               | string | null: false               |
| street_address     | string | null: false               |
| building           | string | null: false               |
| phone_number       | integer| null: false               |
| days_to_ship       | integer| null: false               |
| user_id            | integer| null: false               |
| photo_id           | integer| null: false               |


### Association

- belongs_to :user
- belongs_to :item
