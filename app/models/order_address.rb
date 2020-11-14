class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :product_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
   end 

  def save
    product = Product.find(product.id)
    user = product.user   
    address = Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name,order_id: order.id)
    order = Order.create(product_id: product_id, user_id: user.id, token: token)
  end
end