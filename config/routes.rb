Rails.application.routes.draw do
  root 'static_pages#top'
  get '/guest_login', to: 'user_sessions#guest_login'
  get 'maps', to: 'maps#index'
  resources :quests, only: %i[index create]
  get '/calculate', to: 'maps#calculate'
end
