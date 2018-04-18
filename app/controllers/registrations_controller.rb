class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :user_type)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation,
                                 :current_password, :user_type)
  end


  protected

  def after_sign_up_path_for(resource)
    new_profile_path
  end

end
