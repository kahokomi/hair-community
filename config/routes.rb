Rails.application.routes.draw do
  root "homes#top"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  devise_scope :user do
    post 'users/guest_hairdresser_sign_in' => 'users/sessions#new_hairdresser_guest'
    post 'users/guest_user_sign_in' => 'users/sessions#new_user_guest'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about" => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follows', as: 'follows'
  end
  resources :tweets, only: [:index, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
  resources :chats, only: [:show, :create, :index]
end
