class ReviewsController < ApplicationController
  # избегаем дублирования кода с помощью before_action и находим review и comment по id до запуска контроллера. Важен порядок Экшенов!
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
      flash[:warning] = "Ваш отзыв отправлен!"
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def edit
    
  end

  def show
    # Создаем в памяти новый образец класса comment и сразу же привязываем его к конкретному отзыву(@review). 
    # Делается это все для того, чтобы не создавать отдельную форму для комментариев, а сразу отображать их в show вместе с отзывами.
    @comment = @review.comments.build
    # Находим все комментарии в БД и сортируем их по убыванию(самый свежий ответ будет самым первым)
    @comments = @review.comments.order created_at: :desc 
  end

  def update
    if @review.update review_params
      flash[:warning] = "Ваш отзыв обновлен!"
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy 
      flash[:warning] = "Ваш отзыв удален!"
      redirect_to reviews_path
    else 
      flash[:warning] = "Произошла ошибка!"
      redirect_to reviews_path
    end
  end

  private 
  
  def review_params
    params.require(:review).permit(:body)
  end

  def find_review
    @review = Review.find params[:id]
  end
end
