Rails.application.routes.draw do

  devise_for :users
  root "rooms#index"
  resources :users, only: [:edit, :update,]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end

end
