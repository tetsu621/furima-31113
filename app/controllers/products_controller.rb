class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index  
    @products = Product.includes(:user).order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :show
    else
      render :new
    end  
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :explanation, :price, :image, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end
end
