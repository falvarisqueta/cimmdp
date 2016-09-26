Rails.application.routes.draw do

  get 'sessions/create'
  get 'sessions/destroy'
  get 'appointments/update_visits/:id' => 'appointments#update_visits'

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
  resources :sponsor_charges

  resources :doctors do
    get :patients, on: :member
  end
  resources :patients do
    get :assign_protocol, on: :member
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  root 'welcome#index'
end
