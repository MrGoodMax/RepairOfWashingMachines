# frozen_string_literal: true

class CommentsController < ApplicationController
  # избегаем дублирования кода с помощью before_action и находим review и comment по id до запуска контроллера. 
  # Важен порядок Экшенов! Снаяала ответ, а потом привязанный к нему комментарий!
  before_action :set_review!
  before_action :set_comment!, except: :create

  def create
    @comment = @review.comments.build comment_params
    if @comment.save
      flash[:warning] = "Комментарий создан"
      redirect_to review_path(@review)
    else
      # Определяем переменную для того чтобы можно было отрендерить Show, так как Show в отличии 
      # от redirect_to не предоставляет никакого маршрута, а просто выводит на экран инфу
      @comments = @review.comments.order created_at: :desc 
      render 'reviews/show'
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      flash[:warning] = "Ваш комментарий обновлен!"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy 
    flash[:warning] = "Ваш комментарий удален!"
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
