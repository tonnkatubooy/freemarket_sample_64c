
## freemarket DB設計
# README

## usersテーブル
|Column|Type|Options|Index|
|------|----|-------|-----|
|first_name     |string    |null: false|
|last_name      |string    |null: false|
|first_name_kana|string    |null: false|
|last_name_kana |string    |null: false|
|nickname       |string    |null: false|
|email          |string    |null: false, unique:ture|○|
|birthday       |date      |null: false|
|phone_number   |string    |  |
|introduction   |text      |  |
### Association
- has_one :addrres
- has_many :comments
- has_many :items
- has_one :card

## addrresテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string    |null: false|
|destination_last_name |string    |null: false|
|post_number           |string    |null: false|
|prefecture            |integer   |null: false|
|city                  |string    |null: false|
|house_number          |string    |null: false|
|building              |string    |  |
|user                  |refarences|foreign_key: true|
### Association
- belongs_to :user

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string    |  |
|user   |references|null: false, foreign_key:true|
|customer_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|Index|
|------|----|-------|-----|
|item_name      |string    |null: false|○|
|price          |interger  |null: false|
|discription    |text      |null: false|
|user           |references|null: false, foreign_key: true|
|category       |refarences|null: false, foreign_key: true|
|brand          |refarences|foreign_key: true|
|size           |interger  |null: false|
|status         |interger  |null: false|
|delivery_charge|interger  |null: false|
|area           |interger  |null: false|
|shipping_date  |interger  |null: false|
|shipping_method|interger  |null: false|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :comments
- has_many :pictures

## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string    |  |
|item |refarences|foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name      |string| null: false, index: true |
|ancestry|string| index: true |
### Association
- has_many :items
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|  |
### Association
- has_many :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text      |  |
|user|refarences|foreign_key|
|item|refarences|foreign_key|
### Association
- belongs_to :user
- belongs_to :item