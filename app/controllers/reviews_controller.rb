class ReviewsController < ApplicationController

  def create
    data1 = review_params
    data2 = getProductID
    mergedData = data1.merge!(data2)
    @review = Review.new(mergedData)
    @review.user_id = current_user.id
    @review.save
    redirect_to product_path(id=@review.product_id)
  end

  def destroy
    id = review_delete_params
    Review.find(id).destroy
    product_id= params[:product_id]
    redirect_to product_path(id=product_id)
  end

  private

    def review_params
      params.require(:reviews).permit(:description, :rating)
    end

    def getProductID
      params.permit(:product_id)
    end

    def review_delete_params
      params[:id]
    end

end
