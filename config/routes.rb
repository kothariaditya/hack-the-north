Rails.application.routes.draw do

  post 'user', to: 'users#create'

  use_doorkeeper

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
