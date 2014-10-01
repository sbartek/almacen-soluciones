Rails.application.routes.draw do

  get 'inicio/index'
  root 'inicio#index'

  resources :solicituds
  resources :ficha_proveedors
  resources :proveedors
  resources :proyectos
  resources :subfamilias
  resources :familias
  resources :subfamilia
  resources :familia
  resources :negocio_unidads
  resources :materials
  resources :ubicacions
  resources :fichas do
    resources :ficha_proveedors
    post 'add_subfamilia', on: :member
    get 'delete_subfamilia', on: :member
    resources :materials
  end

  resources :usuarios, only: [:show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
