Rails.application.routes.draw do


  resources :applications
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #root
  root 'pages#home', as: 'home'

  #pages
  get  'dashboard'=>'pages#dashboard', as: 'user_dashboard'
  
  #users
  devise_for :users,:controllers=>{registrations:'registrations',
                                   sessions:'users/sessions'}

  resources :profiles
  resources :faculties
  resources :hrs

  #jobs
  resources :jobs

  #documents
  resources :documents
  get 'drive'=>'documents#drive', as: 'instruu_drive'

  #documentspaces
  resources :document_spaces

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
