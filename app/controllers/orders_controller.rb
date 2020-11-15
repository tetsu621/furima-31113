class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      #pay_product
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
      .merge(user_id: current_user.id, product_id: params[:product_id], token: params[:card_token])
    end

end

