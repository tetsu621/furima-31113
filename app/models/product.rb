class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
