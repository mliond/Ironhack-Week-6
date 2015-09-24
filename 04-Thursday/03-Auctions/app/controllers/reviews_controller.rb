class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @product = @review.product
    if current_user != @product.user
      @review.save
    end
      redirect_to product_path(@product)
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.update(review_params)
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:description, :user_id, :product_id)
  end

end
