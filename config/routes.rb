Rails.application.routes.draw do
    get 'welcome/index'

  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  root 'welcome#index'


  use_doorkeeper # doorkeeper
  mount API::Base => '/api' # Grape

  resources :documentation, only: [:index] do # swagger-ui
    collection do # documentation token redirect
      get :o2c
      get :authorize
    end
  end
end
