Rails.application.routes.draw do
  resources :maps do
    collection do
      #get "locations_stream"
    end
  end

  root 'maps#index'
  resources :trucks
  post 'location', to: 'maps#location'
  get 'locations_stream', to: 'streams#locations', as: :locations
  
  namespace :api do
    namespace :v1 do
    post 'trucks' => 'trucks#create'
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end
  
end
