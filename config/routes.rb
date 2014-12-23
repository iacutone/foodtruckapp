Rails.application.routes.draw do
  resources :maps do
    collection do
      get "locations_stream"
    end
  end

  root 'maps#index'
  resource :trucks
  post 'location', to: 'maps#location'
  get 'locations_stream', to: 'streams#locations', as: :locations
  
  devise_for :trucks #, :controllers => { registrations: 'api/v1/registrations' }
  namespace :api do
    namespace :v1 do
      devise_scope :truck do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end
  
end
