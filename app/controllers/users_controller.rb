class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]
  before_action :set_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back_or_to root_path, success: 'ユーザーを新規登録しました'
    else
      flash.now[:danger] = 'ユーザーの新規登録に失敗しました'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
