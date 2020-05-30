Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#top'
  get 'home/about' => 'home#about'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :profile_images, onle: [:new, :create, :index, :show]
  end
