class PagesController < ApplicationController
  def home
    @jobs=Job.all
    render 'pages/home'
  end
end
