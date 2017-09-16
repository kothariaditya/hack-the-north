Rails.application.routes.draw do

  devise_for :users
  post 'user', to: 'users#create'
  get 'user', to: 'users#list'

  post 'login', to: 'sessions#create'

  get '/', to: 'users#new', as: :root

  get 'records/:id', to: 'records#read'

  get 'prescriptions/:id', to: 'prescriptions#read'

end
