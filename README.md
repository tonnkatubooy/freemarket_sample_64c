## feemarket DB設計

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|comment|references|null: false, foreign_key: true |
|picture|references|null: fales, foreign_key: true|
|category|references|null: false, foreign_key: true |
|discription|text|  |
|price|interger|null: false|
### Association
- belongs_to :user
- has_many :comment
- has_many :picture
- has_many :category


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|  |
### Association
- belongs_to :user
- belongs_to :item


## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|  |
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|  |
### Association
- has_many :item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_number|string|  |
|prefecture|integer|  |
|city|string|  |
|house_number|string|  |
|building|string|  |
### Association
- belongs_to :user


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
### Association
- has_many :comment
- has_many :item