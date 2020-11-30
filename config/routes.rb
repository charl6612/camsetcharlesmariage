Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'voyage', to: 'pages#voyage', as: :voyage
  resources :contacts, only: [:new, :create, :thanks]
  get 'programme', to: 'pages#programme', as: :programme
  get 'contacts/thanks', to: 'contacts#thanks', as: :contacts_thanks
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
