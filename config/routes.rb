Rails.application.routes.draw do
 
  root to: "homes#top"
  devise_for :users
  get 'home/about',to:'pages#about'
  resources :books
  resources :users, only:[:index, :create, :show, :edit, :update]

end
