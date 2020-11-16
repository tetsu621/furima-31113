class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :address

  attr_accessor :token
end
