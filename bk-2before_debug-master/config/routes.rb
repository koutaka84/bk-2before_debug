Rails.application.routes.draw do
root to: 'home#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
	  get '/home/about'
	  get '/users/:id/following' => 'users#follow', as:'follow'
	  get '/users/:id/followers' => 'users#follower', as:'follower'
  resources :books do
	  resource :favorites, only: [:create, :destroy]
	  resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end