class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    product = Product.find(params[:product_id])
    puts "PARAMS: #{params}"
    @review = product.reviews.new(review_params)
    @review.user = current_user
    puts "Review: #{@review.inspect}"
    if @review.save!
      redirect_to product_url params[:product_id], notice: 'Review created!'
      return
    else
      redirect_to product_url params[:product_id], notice: 'Review failed!'
    end
  end

  def destroy
    @review = Review.find params[:id]
    if current_user != @review.user
      redirect_to product_url params[:product_id], notice: 'Unauthorized!'
      return
    end
    @review.destroy
    redirect_to product_url params[:product_id], notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
