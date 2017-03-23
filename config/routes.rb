Rails.application.routes.draw do
  post 'log_visit/create'
  resources :contacts
end
