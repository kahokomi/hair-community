Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follows', as: 'follows'
  end
  resources :tweets, only: [:index, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  resources :chats, only: [:show, :create]

end
