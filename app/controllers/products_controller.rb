class ProductsController < ApplicationController
  def index  
  end
  
  def new
    @products = Products.new
  end

  def create
    def create
      @product = Prototype.new(product_params)
      @product.save
      if @product.save
        redirect_to root_path
      else
         render :new
      end
    end  
  end


  private

  def product_params
    params.require(:message).permit(:title, :explanation, :price, :image).merge(user_id: current_user.id)
  end
end
