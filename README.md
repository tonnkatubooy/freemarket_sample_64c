# フリマアプリのクローンサイト

![image](https://user-images.githubusercontent.com/58540888/82293088-f9299080-99e6-11ea-8f8e-c973ed5c6dbe.png)

## 開発環境
<br>

- Ruby on Rails
- MY SQL
- Github
- JavaScript
- jQuery
- AWS

## 制作経緯
<br>

1. Ruby on Railsをスクールで重点的に学習し約半年間の学習をアウトプットする
2. githubを使ったアジャイル開発の経験を積むため
3. 自身のポートフォリオ制作のため

## 工夫した点
<br>

- フリマアプリサイトのようにUIを意識したデザインと、実際に商品の売買ができるよう実装した点
- 各カテゴリーごとに出品した商品を振り分けてトップページカテゴリーボタンから検索できるよう実装
- gem pay.jpを使い商品の購入ができるよう実装
- 単体テストの記載

## 自身の担当箇所
- 商品出品ページ（フロントエンド）
＊商品の新規投稿画面の作成　HTML,CSSを使ってデザイン
＊可読性のあるコードを意識
- 商品詳細ページ（フロントエンド）
＊出品した商品の詳細画面の作成　HTML,CSSを使ってデザイン
＊可読性のあるコードを意識
- 商品一覧表示（サーバサイド）
＊トップページに出品した商品の一覧を設け、DBから引用と表示
- 商品削除機能（サーバサイド）
＊出品した商品の削除ができるよう商品の詳細ページ下に削除ボタンを設置し
DBから削除するよう実装
- 商品編集機能（サーバサイド）
＊出品した商品の編集ができるよう商品の詳細ページ下に編集ボタンを設置
＊元あるデータをedit画面に表示させておくよう設定


## DB設計
<br>

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
|destination_first_name     |string    |null: false|
|destination_last_name      |string    |null: false|
|destination_first_name_kana|string    |null: false|
|destination_first_name_kana|string    |null: false|
|post_number                |string    |null: false|
|prefecture                 |integer   |null: false|
|city                       |string    |null: false|
|house_number               |string    |null: false|
|building                   |string    |  |
|user                       |refarences|foreign_key: true|
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
|status         |interger|null: false| 
|delivery_charge_id|interger|null: false|
|area_id        |interger  |null: false|
|shipping_date_id  |interger|null: false|
|shipping_method_id|interger|null: false|
|seller_id      |interger  |null: false|
|buyer_id       |interger  |null: false|
|item_status    |interger  |null: false|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :comments
- has_many :pictures
- belongs_to_active_hash :status
- belongs_to_active_hash :
- belongs_to_active_hash :shipping_date  
- belongs_to_active_hash :shipping_method

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

## statusテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :items

## delivery_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :items

## shipping_dateテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :items

## shipping_methodテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :items


