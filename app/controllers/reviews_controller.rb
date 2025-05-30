class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(strong_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(params[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:review).permit(:content, :title)
  end
end
