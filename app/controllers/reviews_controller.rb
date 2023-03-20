class ReviewsController < ApplicationController
  before_action :find_review, only: %i[edit show update destroy]
  
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = "Ваш отзыв отправлен!"
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def edit
    
  end

  def show
    @comment = @review.comments.build
    @comments = @review.comments.order created_at: :desc 
  end

  def update
    if @review.update review_params
      flash[:success] = "Ваш отзыв обновлен!"
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review.destroy 
    flash[:success] = "Ваш отзыв удален!"
    redirect_to reviews_path
  end

  private 
  
  def review_params
    params.require(:review).permit(:body)
  end

  def find_review
    @review = Review.find params[:id]
  end
end
