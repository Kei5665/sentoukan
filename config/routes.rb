Rails.application.routes.draw do
  get 'maps', to: 'maps#index'
  get 'shop/:id', to: 'shops#show'
  resources :quests, only: %i[index show]
end
