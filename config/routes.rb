Rails.application.routes.draw do
  resources :trait_combinations, only: [:create]
  resources :personalities, only: [:index]
  get '/personalities/:type', to: 'personalities#show'
  resources :answers, only: [:index, :show]
  resources :traits, only: [:index, :show]
  resources :matches, except: [:update]
  resources :avatars, only: [:index, :show]
  resources :characters, only: [:index, :show]
  resources :users, except: [:create]
  resources :conversations, :messages
  post '/signup', to: 'users#create'
  post '/login', to: 'users#log_in'
  get '/other/:id', to: 'users#other_users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
