Rails.application.routes.draw do

  devise_for :users
  root "rooms#index"
  resources :users, only: [:edit, :update,]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'rooms/:id'  =>  'rooms#destroy'

  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

end
