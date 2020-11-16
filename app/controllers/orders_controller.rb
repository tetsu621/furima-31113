class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
    if current_user == @product.user || @product.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @product = Product.find(params[:product_id])
    if @order_address.valid?
      pay_product
      @order_address.save
      redirect_to root_path
    else
     @product = Product.find(params[:product_id])
     render action: :index
    end 
  end

  private

    def order_params
      params.require(:order_address).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number)
      .merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def pay_product
      Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @product.price, # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end

