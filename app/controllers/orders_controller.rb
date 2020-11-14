class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @oreder_address.valid
      pay_product
      @order_address.save
      redirect_to root_path
    else
     @product = prodoct.find(params[:product_id])
     render action: :index
    end 
  end

  private

    def order_params
      params.require(:order_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(product_id: params[product_id])
    end

end

