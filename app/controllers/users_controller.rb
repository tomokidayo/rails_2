# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "プロフィール更新成功"
    else
      render :edit
    end
  end

  def edit_account
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_account
    if @user.update(account_params)
      redirect_to root_path, notice: "アカウント更新成功"
    else
      render :edit_account
    end
  end

  def update_profile
    # @user = current_user
    if @user.update(profile_params)
      redirect_to root_path, notice: "プロフィールを更新しました"
    else
      render :edit_profile, status: :unprocessable_entity
    end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # バリデーションエラーの内容をログに出力
      logger.debug @user.errors.full_messages
      render :new
    end
  end


  def show
    # @user = User.find(params[:id])
    @user = current_user
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    # params.require(:user).permit(:name, :email, :password, :password_confirmation)
    params.require(:user).permit(:name, :email, :password, :icon, :introduction, :password_confirmation)
  end

  def account_params
    if params[:user][:password].blank?
      params.require(:user).permit(:email)
    else
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  def profile_params
    params.require(:user).permit(:name, :icon, :introduction)
  end
end
