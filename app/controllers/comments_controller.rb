# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_review!
  before_action :set_comment!, except: :create

  def create
    @comment = @review.comments.build comment_params
    if @comment.save
      flash[:success] = "Комментарий создан"
      redirect_to review_path(@review)
    else
      @comments = @review.comments.order created_at: :desc 
      render 'reviews/show'
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      flash[:success] = "Ваш комментарий обновлен!"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy 
    flash[:success] = "Ваш комментарий удален!"
    redirect_to review_path(@review)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_review!
    @review = Review.find params[:review_id]
  end

  def set_comment!
    @comment = @review.comments.find params[:id]
  end
end
