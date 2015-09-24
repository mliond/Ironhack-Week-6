class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @bid = Bid.new
    @highest_bid = @product.bids.sort{|a| a.amount}.first
    @review = Review.new
  end

  def purchase
    @product = Product.find(params[:product_id])
    UserMailer.purchase(current_user, @product).deliver_now
    @product.reviews.destroy_all
    @product.bids.destroy_all
    @product.destroy
    redirect_to products_path
  end

end
