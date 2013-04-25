ZipHome::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  match 'partners', :to => 'pages#partners'
  match 'coworking', :to => 'pages#coworking'
  match 'contact', :to => 'pages#contact'
  match 'apply', :to => 'pages#apply'

  resources :users, :only => [:index, :show]
  resources :startups do
    resources :startupships, :only => [:index, :create, :destroy]
  end

  resources :posts
  resources :events
  resources :batches do
    resources :batch_startup_joins, :only => [:create, :destroy]
  end
  # there is :index action for batch resource because form by default
  # sends to create/update action wich is referred as 
  # put/post request to batches_path

end
