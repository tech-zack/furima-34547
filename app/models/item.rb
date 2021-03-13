class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_source
  belongs_to :delivery_date
  has_many   :messages

  with_options presence: true do
    validates :image
    validates :title
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_source_id
    validates :delivery_date_id
  end

  validates :product_price,format: {with:/\A[0-9]+\z/}
  validates :product_price,numericality: {greater_than: 299}
  validates :product_price,numericality: {less_than: 10000000}



end
 