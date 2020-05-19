Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'retweets/:tweet_id', to: 'retweets#create', as: 'retweets'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :tweets
  root 'tweets#index'
end
