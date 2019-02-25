Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/forecast", to: 'forecast#show'
      get "/backgrounds", to: 'background#show'
      post '/users', to: 'users#create'
      get '/gifs', to: 'gifs#index'
    end
  end
end
