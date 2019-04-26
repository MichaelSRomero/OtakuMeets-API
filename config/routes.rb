Rails.application.routes.draw do
  resources :answers
  resources :traits
  resources :matches
  resources :avatars
  resources :characters
  resources :users, except: [:create]
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
