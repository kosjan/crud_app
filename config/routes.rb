Rails.application.routes.draw do
  devise_for :users
  resources :employees
  #get 'home/index'
  root 'employees#index'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
