Rails.application.routes.draw do
  resources :maps, only: %i[index show]
  get 'shop/:id', to: 'shops#show'
end
