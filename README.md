
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
|addrres        |references|null: false|
### Association
- belongs_to :addrres
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
|size           |refarences|null: false, foreign_key: true|
|status         |refarences|null: false, foreign_key: true|
|delivery_charge|refarences|null: false, foreign_key: true|
|area           |refarences|null: false, foreign_key: true|
|shipping_date  |refarences|null: false, foreign_key: true|
|shipping_method|refarences|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- belongs_to :size
- belongs_to :status
- belongs_to :delivery_charge
- belongs_to :area
- belongs_to :shipping_date
- belongs_to :shipping_method
- has_many :comments
- has_many :pictures

## size
|Column|Type|Options|
|------|----|-------|
|size  |string|  |
### Association
- has_many :items

## status
|Column|Type|Options|
|------|----|-------|
|status|string|  |
### Association
- has_many :items

## delivery_charge
|Column|Type|Options|
|------|----|-------|
|delivery_charge|string|  |
### Association
- has_many :items

## area
|Column|Type|Options|
|------|----|-------|
|area|string|  |
### Association
- has_many :items

## shipping_date
|Column|Type|Options|
|------|----|-------|
|shipping_date|string|  |
### Association
- has_many :items

## shipping_method
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|  |
### Association
- has_many :items

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
|main      |string|  |
|main_genre|string|  |
|genre_list|string|  |
### Association
- has_many :items

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