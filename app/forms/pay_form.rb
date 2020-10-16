class PayForm
  include ActiveModel::Model #ActiveModel::Modelモジュールをinclude引き継いでいる（これでバリデーションが使えるようになる）
  attr_accessor :item_id, :token, :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :user_id
  # attr_accessorを使うことでitem_idなどをここで使うことができるようになる。

  # <<バリデーション>>includeによってバリデーションが使えるようになっている
  with_options presence: true do
    validates :item_id
    validates :token, presence: { message: "can't be blank" }
    #郵便番号は3文字-4文字
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    #都道府県（0以外でなければ弾く）numericalityは数値のみがつかわれている事を検証。
    validates :prefecture, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, length: { maximum: 11, message: 'Too long' }
    # 電話番号は入力フォームで制限してますが、一応つけています。
    validates :user_id
  end

  def save
      item_transaction = ItemTransaction.create!(
        item_id: item_id,
        user_id: user_id
      )
    Address.create!(
    item_transaction_id: item_transaction.id,
    postal_code: postal_code,
    prefecture: prefecture,
    city: city,
    addresses: addresses,
    building: building,
    phone_number: phone_number
    )
  end
end