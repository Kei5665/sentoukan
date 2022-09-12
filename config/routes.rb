Rails.application.routes.draw do
  root 'static_pages#top'
  get '/guest_login', to: 'user_sessions#guest_login'
  get 'maps', to: 'maps#index'
  get 'shop/:id', to: 'shops#show'
  resources :quests, only: %i[index show]
end
