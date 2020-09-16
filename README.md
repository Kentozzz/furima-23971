# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|birthday|date|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|nickname_furigana|string|null: false|
|nickname|string|null: false|


### Association
- has_many :items
- has_many :purchases

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null: false|
|price|integer|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|pay_id|integer|null: false|
|prefecture_id|integer|null: false|
|days_id|integer|null: false|
|user|reference|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :purchase

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|integer|null: false|
|postal_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
|phone|integer|null: false|
|prechase|reference|null: false, foreign_key: true|


### Association
- has_one :address