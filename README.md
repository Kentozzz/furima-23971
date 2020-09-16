# DB設計
## usersテーブル
|Column           |Type  |Options                  |
|-----------------|------|-------------------------|
|email            |string|null: false, unique: true|
|password         |string|null: false              |
|birthday         |date  |null: false                |
|lastname         |string|null: false              |
|firstname        |string|null: false              |
|lastname_kana    |string|null: false              |
|firstname_kana   |string|null: false              |
|nickname         |string|null: false              |
### Association
- has_many :items
- has_many :purchases
## itemsテーブル
| Column     | Type      | Options                       |
| --------   | --------  | ----------------------------- |
| name       | string    | null: false                   |
| content    | text      | null: false                   |
| price      | integer   | null: false                   |
| category_id| integer   | null: false                   |
| status_id  | integer   | null: false                   |
| pay_id     | integer   | null: false                   |
| place_id   | integer   | null: false                   |
| days_id    | integer   | null: false                   |
| user       | references| null: false, foreign_key: true|
### Association
- belongs_to :user
- has_one :purchase
## purchasesテーブル
| Column      | Type      | Options                      |
| ----------- | --------- | -----------------------------|
|item         |references |null: false, foreign_key: true|
|user         |references |null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user
- has_one :address
## addressesテーブル
| Column      | Type      | Options                      |
| ----------- | --------- | ---------------------------- |
| place_id    | integer   | null: false                  |
| postal_code | string    | null: false                  |
| city        | string    | null: false                  |
| house_number| string    | null: false                  |
| building    | string    |                              |
| phone       | string    | null: false                  |
| purchase    | references | null:false, foreign_key: true|
### Association
- belongs_to: purchase