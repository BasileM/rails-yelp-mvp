class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(task_params)
    @review.save
    redirect_to tasks_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(restaurant_params)
    redirect_to reviews_path(@reviews)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:review).permit(:content, :rating)
  end
end
