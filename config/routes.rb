Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/show'
  devise_for :users
  root to: 'pages#home'

  resources :user do
    resources :presences
    resources :children  
    resources :invites
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
