Rails.application.routes.draw do
  devise_for :users
  get 'users/unsubscribe'
  patch 'users/withdraw'
  get 'users/mypage' => 'users#show'
  resources :users, only: [:edit, :update]
  resources :shops, only: [:new, :index, :show, :create]
  resources :comments
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
