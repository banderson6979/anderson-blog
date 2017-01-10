Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: "posts#index"
  devise_for :admins
  resources :posts
end
