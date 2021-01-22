Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :mangas
      resources :comments
      resources :manga_categories
      resources :authors
      resources :categories
      resources :chapters
      resources :stats
      root to: "stats#index"
    end
  devise_for :users
  resources :mangas do 
    resources :chapters
    collection do
      post 'subcribe'
    end
  end
  resources :comments, only: :create
  resources :users, only: [:edit, :update, :index, :delete]
  post 'like', to: 'mangas#like', as: 'like'
  root 'mangas#index'
end
