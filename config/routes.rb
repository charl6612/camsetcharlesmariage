Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :user do
    resources :presences
    resources :children    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
