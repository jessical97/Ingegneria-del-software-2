Rails.application.routes.draw do
  root :to => 'startup#index'

  resources :bills
  resources :activities
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
