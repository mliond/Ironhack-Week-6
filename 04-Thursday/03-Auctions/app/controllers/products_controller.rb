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

end
