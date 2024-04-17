Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "home_about"
  devise_for :users
  
  resources :books do
  resources :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
   # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
end
