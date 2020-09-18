class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # <<アクティブストレージの設定関連>>
  has_one_attached :image

  # 値が入っているか検証
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end
  
  # <<アクティブハッシュの設定関連>>
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  belongs_to :user
  has_one :item_transaction
  has_one_attached :image

end
