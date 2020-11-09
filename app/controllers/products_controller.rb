class ProductsController < ApplicationController
  def index  
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    if @product.save
        redirect_to root_path
    else
        render :new
    end  
  end


  private

  def product_params
    params.require(:message).permit(:title, :explanation, :price, :image, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end
end
