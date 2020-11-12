class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
   validates :title
   validates :explanation
   validates :category_id
   validates :status_id
   validates :delivery_fee_id
   validates :area_id
   validates :day_id
   validates :price
   validates :image
  end

  with_options numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :price
  end

  validates_inclusion_of :price, in: 300..9999999

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
  
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 1 } 
end
