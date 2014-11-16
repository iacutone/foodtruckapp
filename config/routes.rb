Rails.application.routes.draw do
  resources :trucks
  # namespace :api do
  #   namespace :v1 do
  #     resources :locations, :trucks
  #   end
  # end
  
  namespace :api do
    namespace :v1 do
      devise_scope :truck do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end
  # root 'welcome#index'
end
