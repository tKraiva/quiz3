Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      get 'user/current'
    end
  end

  resources :users, only: [:new, :create]
  
  resource :session, only: [:new, :create, :destroy]

  
  
  resources :auctions do

    resources :bids, only: [:create, :destroy]

  end
  namespace :api, defaults: { format: :json } do
  
    namespace :v1 do
 
      resources :auctions
   
      resource :session, only: [:create, :destroy]

      resources :users, only: [:create] do
        # api/v1/user/current
        get :current, on: :collection
        # default
        # api/v1/user/:id/current
      end
    end
  end
end
