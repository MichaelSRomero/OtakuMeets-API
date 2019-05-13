Rails.application.routes.draw do
  resources :trait_combinations, only: [:create]
  resources :personalities, except: [:show]
  get '/personalities/:type', to: 'personalities#show'
  resources :answers
  resources :traits, only: [:index, :show]
  resources :matches
  resources :avatars
  resources :characters
  resources :users, except: [:create]
  post '/signup', to: 'users#create'
  post '/login', to: 'users#log_in'
  get '/other/:id', to: 'users#other_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
