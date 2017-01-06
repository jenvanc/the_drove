Rails.application.routes.draw do
  devise_for :controllers
  devise_for :users, :controllers => {:registrations => "user/registrations"}

  root to: 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships
  get '/users/index', to: 'users#index'

end
