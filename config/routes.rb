Rails.application.routes.draw do
	get 'top' => 'homes#top'
	get 'about' => 'homes#about'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :profile_images, onle: [:new, :create, :index, :show]
  root :to => 'homes#top'
  root 'users#show'
end
