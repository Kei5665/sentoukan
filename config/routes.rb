Rails.application.routes.draw do
  root 'static_pages#top'
  get '/guest_login', to: 'user_sessions#guest_login'
  get '/calculate', to: 'quests#calculate'
  get 'terms', to: 'static_pages#terms'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  post '/scrape', to: 'scrapes#scrape'
  resources :maps, only: %i[index]
  resources :quests, only: %i[index create]
  resources :scrapes, only: %i[index create]
  resources :users, only: %i[new update]
  resources :shops, only: %i[index]
end
