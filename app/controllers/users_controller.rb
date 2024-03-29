# frozen_string_literal: true

class UsersController < ApplicationController
  # избегаем дублирования кода с помощью before_action и находим review и comment по id до запуска контроллера. Важен порядок Экшенов!
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]

  def edit 
  end

  def update
    if @user.update user_params
      flash[:warning] = 'Ваш профиль успешно обновлен!'
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:warning] = "Вы успешно зарегистрироались!, #{@user.name}"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password)
  end
end

