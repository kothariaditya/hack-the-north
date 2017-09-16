Rails.application.routes.draw do
  get 'records/:id', to: 'records#read'

  get 'prescriptions/:id', to: 'prescriptions#read'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
