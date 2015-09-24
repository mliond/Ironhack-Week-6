class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)
    @product = @bid.product
    @highest_bid = @product.bids.sort{|a| a.amount}.first.amount
    if (@bid.amount > @highest_bid)&&(@bid.amount > @bid.product.minprice)&&(@bid.user != @product.user)
      @bid.save
      redirect_to user_path(current_user)
    else
      redirect_to product_path(@bid.product)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id, :product_id)
  end

end
