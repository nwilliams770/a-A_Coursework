Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs, except: [:destroy]
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]


end
