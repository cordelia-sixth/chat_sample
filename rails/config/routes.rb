Rails.application.routes.draw do
  root to: 'rooms#show'

  resources :fileuploads, only: [:index, :create, :new]
end
