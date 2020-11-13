class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
   end 

  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Order.create(product: product, user_id: user.id)
  end
end