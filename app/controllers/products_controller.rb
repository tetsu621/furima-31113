class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, only: [:edit, :update]
  def index  
    @products = Product.includes(:user).order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    if @products.order != nil || current_user.id != @products.user_id
      redirect_to root_path
    end 
  end

  def update
    if product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :explanation, :price, :image, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_product
    @products = Product.find(params[:id])
  end
end
