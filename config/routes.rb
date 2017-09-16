Rails.application.routes.draw do

  post 'user', to: 'users#create'

  use_doorkeeper

  get '/', to: 'users#new', as: :root

  get 'records/:id', to: 'records#read'

  get 'prescriptions/:id', to: 'prescriptions#read'

end
