Rails.application.routes.draw do
  get 'contacts/new'
  get 'contact/new'
  devise_for :users
  root to: 'pages#home'
  resources :contacts, only: [:new, :create]



  resources :user do
    resources :children  
    resources :invites do 
      resources :presences
    end
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
