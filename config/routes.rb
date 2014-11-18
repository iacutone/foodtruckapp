Rails.application.routes.draw do
  
  devise_for :trucks, :controllers => { registrations: 'api/v1/registrations' }
  namespace :api do
    namespace :v1 do
      devise_scope :truck do
        post 'registrations', to:'registrations#create'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end
  root 'trucks#new'
end
