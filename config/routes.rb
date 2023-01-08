Rails.application.routes.draw do
  get "search" => "searches#search"
  get 'favorit1es/create'
  get 'favorit1es/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: 'about'

  resources :books, only: [:new, :create, :index, :show, :update, :edit, :destroy] do 
    resources :book_comments, only: [:create, :destroy]
    resource :favorit1es, only: [:create, :destroy]
  end 
  
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :chats, only: [:show, :create]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  
end
