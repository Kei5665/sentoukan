Rails.application.routes.draw do
  get 'maps', to: 'maps#index'
  get 'shop/:id', to: 'shops#show'
end
