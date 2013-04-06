ZipHome::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  match 'startups', :to => 'pages#startups'
  match 'people', :to => 'pages#people'
  match 'partners', :to => 'pages#partners'
  match 'coworking', :to => 'pages#coworking'
  match 'contact', :to => 'pages#contact'

  resources :posts

end
