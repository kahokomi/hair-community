Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'following'
      get 'followers'
    end
  end
end
