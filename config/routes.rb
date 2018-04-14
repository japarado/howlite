Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #root
  root 'pages#home', as: 'home'

  #users
  devise_for :users,:controllers=>{registrations:'registrations',
                                   sessions:'users/sessions'}

  resources :profiles
  resources :faculties
  resources :hrs

  #jobs
  resources :jobs


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
