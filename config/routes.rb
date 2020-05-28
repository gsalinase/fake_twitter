Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'retweets/:tweet_id', to: 'retweets#create', as: 'retweets'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'
  get 'tweets/hashtags/:name', to: 'tweets#hashtags'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :tweets do 
    collection do
      get :search_tweet
    end
  end
  post 'api/news'
  get 'api/:date_1/:date_2', to: 'api#date_tweet'
  post 'api/create_tweet'
  root 'tweets#index'
end
