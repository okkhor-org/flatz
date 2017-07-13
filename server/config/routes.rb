Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/me', to: 'auth#show'
    end
  end
end
