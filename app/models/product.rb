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
  validates :day_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
  
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 1 } 
end
