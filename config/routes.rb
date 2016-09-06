Rails.application.routes.draw do
  
  resources :visit_types
  resources :payments
  resources :users
  resources :protocols
  resources :patients
  resources :appointments
  resources :doctors
  resources :diseases
  resources :visits
  resources :sponsors

  resources :doctors do
    get :patients, on: :member
  end
  resources :patients do
    get :assign_protocol, on: :member
  end
  root 'welcome#index'
end
