ZipHome::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  match 'partners', :to => 'pages#partners'
  match 'coworking', :to => 'pages#coworking'
  match 'contact', :to => 'pages#contact'

  resources :users, :only => [:index, :show]
  resources :startups

  resources :posts
  resources :events

end
