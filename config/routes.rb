Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contacts, only: [:new, :create]
  post 'songs/search', to: 'songs#search', as: :songsearch
  resources :songs, only: [:new, :create, :destroy]



  resources :user do
    resources :songs, only: [:index]
    resources :children  
    resources :photos
    resources :invites do 
      resources :presences
    end
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
