class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @user = User.find(params[:user_id])
    @product = Product.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)
    if @product.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @highest_bidder = @product.bids.sort_by { |k| k["amount"] }.last.user.name
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :deadline)
  end

end
