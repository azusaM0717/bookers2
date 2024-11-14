Rails.application.routes.draw do
 
  get 'pages/about'
  devise_for :users
  root to: "homes#top"
  get 'about' => 'pages#about'
  resources :books, only:[:new, :create, :edit, :update, :index, :show, :destroy]
  resources :users, only:[:index, :show, :edit, :update]



end
