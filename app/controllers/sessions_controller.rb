# frozen_string_literal: true

class SessionsController < ApplicationController
  # избегаем дублирования кода с помощью before_action и находим review и comment по id до запуска контроллера. Важен порядок Экшенов!
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy
  before_action :set_user, only: :create

  def new; end

  def create
    if @user&.authenticate(params[:password])
      do_sign_in
      flash[:warning] = "Добро пожаловать обратно, #{current_user.name}!"
      redirect_to root_path
    else
      flash.now[:warning] = 'Неккоректный email или пароль!'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:warning] = 'Возвращайтесь обратно!'
    redirect_to root_path, status: :see_other
  end

  private

  def set_user
    @user = User.find_by email: params[:email]
  end

  def do_sign_in
    sign_in @user
    remember(@user) if params[:remember_me] == '1'
  end
end
