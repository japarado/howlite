Rails.application.routes.draw do
  devise_for :users
  devise_for :hrs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
