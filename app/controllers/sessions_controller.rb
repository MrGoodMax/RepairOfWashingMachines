# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy
  
  def new
  
  end

  def create
    user = User.find.by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      flash[:success] = "Добро пожаловать обратно!, #{current_user.name}"
      redirect_to root_path
    else
      flash.now[:warning] = 'Неккоректный email или пароль!'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Возвращайтесь обратно!"
    redirect_to root_path
  end
end