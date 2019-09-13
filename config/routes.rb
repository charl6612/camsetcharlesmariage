Rails.application.routes.draw do
  get 'contact/new'
  devise_for :users
  root to: 'pages#home'
  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'
  resources :contacts, only: [:new, :create]



  resources :user do
    resources :children  
    resources :invites do 
      resources :presences
    end
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
