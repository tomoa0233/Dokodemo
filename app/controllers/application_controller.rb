class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_state, only: [:create], if: :devise_controller?

  def after_sign_in_path_for(resource)
   users_mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  #@user.valid_passward?は入力されたパスワードが正しいかどうか
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.is_active == false)
      flash[:notice] = "退会しています。再度登録してご利用ください。"
      redirect_to new_user_registration_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex, :introduction, :telephone])
  end
end
