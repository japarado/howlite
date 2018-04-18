class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to(user_dashboard_path)
    else
    @jobs=Job.all
    render 'pages/home'
    end
  end

  def dashboard
    if !user_session
      redirect_to(new_user_session_path)
    else
      render 'pages/user/dashboard'
    end
  end
end
