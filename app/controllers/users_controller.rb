class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def find_user; @user = User.find(params[:id]); end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :sex, :introduction, :telephone, :email)
  end
end
