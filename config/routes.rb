Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # devise_for :users
  post 'user', to: 'users#create'
  get 'user', to: 'users#list'
  get 'user/:id', to: 'users#read'
  get 'user/:id/qrcode', to: 'users#qrcode'

  get 'web/user/:id', to: 'users#info', as: :user_info

  get '/', to: 'users#new', as: :root

  get 'users/:user_id/records/:record_id/prescriptions/:id', to: 'prescriptions#read_one'

  get 'users/:user_id/records/:record_id/prescriptions', to: 'prescriptions#read_all'

  post 'users/:user_id/records/:record_id/prescriptions', to: 'prescriptions#create'

  put 'users/:user_id/records/:record_id/prescriptions/:id', to: 'prescriptions#update'

  get 'users/:user_id/records/:record_id', to: 'records#read_one'

  get 'users/:user_id/records', to: 'records#read_all'

  post 'users/:user_id/records', to: 'records#create'

  put 'users/:user_id/records/:record_id', to: 'records#update'
end
