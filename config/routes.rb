Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/show'
  devise_for :users
  root to: 'pages#home'
  get 'spotify', to: 'pages#spotify', as: :spotify
  get 'spotify/artists', to: 'artists#index'
  get 'spotify/artists/:id', to:'artists#show', as: 'artist'

  resources :user do
    resources :presences
    resources :children    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
