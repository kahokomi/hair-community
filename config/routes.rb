Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    collection do
      get 'following'
      get 'followers'
    end
  end
  resources :tweets, only: [:index, :create, :destroy]
  
end
