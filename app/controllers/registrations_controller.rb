class RegistrationsController < Devise::RegistrationsController
=begin
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)


        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  if User.where(email: sign_up_params[:email]).user_type == 'FACULTY'
    Faculty.create(
        :user_id => User.where(email: sign_up_params[:email]).id
    )
  else
    Hr.create(
        :user_id => User.where(email: sign_up_params[:email]).id
    )
  end
=end
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
