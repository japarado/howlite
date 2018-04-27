class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(*)
    new_user_session_path
  end

  #def require_login
  #  unless
  #end
end
