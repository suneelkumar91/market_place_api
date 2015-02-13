MarketPlaceApi::Application.routes.draw do
  
  devise_for :users
  mount SabisuRails::Engine => "/sabisu_rails"
   # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :products, :only => [:create, :update, :destroy]
        resources :orders, :only => [:index]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:index, :show]
    end
  end

end
