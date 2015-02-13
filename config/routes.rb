MarketPlaceApi::Application.routes.draw do
  
  devise_for :users
  mount SabisuRails::Engine => "/sabisu_rails"
   # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
      # We are going to list our resources here
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end

end
