Rails.application.routes.draw do
 
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'books/new'
  get 'books/create'
  get 'books/index'
  get 'books/show'
  get 'books/destroy'
  devise_for :users
root to: "homes#top"

end
