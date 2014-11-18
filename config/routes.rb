Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :trucks
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end
  # root 'welcome#index'
end
