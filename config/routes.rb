Rails.application.routes.draw do
  
  devise_for :users
  root 'users#index'

  resources :cards do
    resources :bills
  end
end