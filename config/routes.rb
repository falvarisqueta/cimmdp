Rails.application.routes.draw do
  get 'diseases/index'
  get 'doctors/index'
  get 'appointments/index'
  get 'patients/index'
  get 'protocols/index'
  get 'users/index'
  get 'welcome/index'

  resources :users
  resources :protocols
  resources :patients
  resources :appointments
  resources :doctors
  resources :diseases

  root 'welcome#index'
end
