
## feemarket DB設計
# README

This README would normally document whatever steps are necessary to get the
application up and running.

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name     |string|null: false|
|last_name      |string|null: false|
|first_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname       |string|null: false|
|email          |string|null: false|
|birthday       |date  |  |
### Association
- has_many :comment
- has_many :item

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string   |null: false|
|destination_last_name |string   |null: false|
|post_number           |string   |null: false|
|prefecture            |integer  |null: false|
|city                  |string   |null: false|
|house_number          |string   |  |
|building              |string   |  |
|phone_number          |string   |  |
|user                  |refarences|foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name      |string    |null: false|
|price          |interger  |null: false|
|discription    |text      |  |
|user           |references|foreign_key: true|
|category       |refarences|foreign_key: true|
|brand          |refarences|foreign_key: true|
|size           |string    |  |
|status         |string    |  |
|delivery_charge|string    |  |
|area           |string    |  |
|shipping_date  |string    |  |
### Association
- belongs_to :user
- belongs_to :brands
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