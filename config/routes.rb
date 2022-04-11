Rails.application.routes.draw do
  get 'users/account'
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/show'
  get 'rooms/index'
  
  scope '/users' do
    resource :profile, only: [:show, :update]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  get 'rooms/posts'
  get 'rooms/search'
  resources :rooms, only: [:new, :create, :show]
  resources :reservations, only: [:index, :new, :create, :show]
  root 'rooms#index'
end
