Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'maps', to: 'maps#index'
  get 'shop/:id', to: 'shops#show'
end
