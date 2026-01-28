Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :destroy],
    constraints: { id: /\d+/ }
    
  end

  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
