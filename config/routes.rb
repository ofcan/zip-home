ZipHome::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  match 'partners', :to => 'pages#partners'
  match 'coworking', :to => 'pages#coworking'
  match 'contact', :to => 'pages#contact'
  match 'apply', :to => 'pages#apply'

  resources :users, :only => [:index, :show, :update]
  resources :startups do
    resources :startupships, :only => [:index, :create, :destroy]
  end

  resources :batches do
    resources :batch_startup_joins, :only => [:create, :destroy]
  end

  resources :events, :posts do
    resources :comments, :only => [:create, :destroy]
  end

end
