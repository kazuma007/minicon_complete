Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller_name#action_name'
  root 'events#index'
  
  root "top#index"
  resource :sessions, only: [:new, :create, :destroy]
  resources :users #追加分
  
  
  
  #以下今回追加分
  resources :events do
    member do #本一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
    end
  end
  #個人ページからお気に入りを削除する
  resources :favorites, only: [:destroy, :index]
  
  resources :events, only: [:index] do
    resources :purchases, only: [:new, :create]
  end

  get '/purchases', to: 'purchases#index'
  
  

  namespace :admin do
    resources :event_categories
    resources :events
  end
end
