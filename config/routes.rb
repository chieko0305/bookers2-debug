Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
  end

  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end

  get "/search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end