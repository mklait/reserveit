Rails.application.routes.draw do
  devise_for :owners
  root to: "restaurants#index"
 
  resources :restaurants do 
  	resources :reservations
  end

  get 'dashboard', to: 'dashboards#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
