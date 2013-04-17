ZipHome::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  match 'startups', :to => 'pages#startups'
  match 'partners', :to => 'pages#partners'
  match 'coworking', :to => 'pages#coworking'
  match 'contact', :to => 'pages#contact'

  resources :users, :only => [:index]

  resources :posts
  resources :events

end
