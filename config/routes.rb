Rails.application.routes.draw do
  root 'static_pages#top'
  get '/guest_login', to: 'user_sessions#guest_login'
  get '/calculate', to: 'quests#calculate'
  post '/scrape', to: 'scrapes#scrape'
  resources :maps, only: %i[index]
  resources :quests, only: %i[index create]
  resources :scrapes, only: %i[index create]
  resources :users, only: %i[new update]
end
