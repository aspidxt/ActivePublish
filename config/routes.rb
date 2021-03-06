Rails.application.routes.draw do
  root 'publications#index'

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :publications

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  get '/sign_up', to: 'users#new', as: :sign_up

  resources :chatrooms, param: :slug
  resources :messages

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
