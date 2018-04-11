class PagesController < ApplicationController
  def home
    render 'pages/home'
  end
  def jobs
    render 'jobs/list'
  end
end
