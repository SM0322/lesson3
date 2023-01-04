Rails.application.routes.draw do

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
  resources :users, only: [:show, :index, :edit, :update]
end
