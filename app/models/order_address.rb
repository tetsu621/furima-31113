class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id, :token, :order_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    validates :token
   end 

  validates :area_id, numericality: { other_than: 1}

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end