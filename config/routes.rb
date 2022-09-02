Rails.application.routes.draw do
  devise_for :artists, controllers: { registrations: "registrations" }
  get 'arts/show'
  get 'artists/show'
  root to: "pages#home"
  # mount StripeEvent::Engine, at: '/stripe-webhooks'
  mount StripeEvent::Engine, at: '/webhook_endpoints'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :artists, only: ["show"] do
    resources :arts, only: ["new", "create", "edit"]
    member do
      get :mycart
    end

    member do
      post :follow
      post :unfollow
    end

    resources :chatrooms, only: [:create]
  end

  resources :orders, only: ["show", "create"] do
    resources :payments, only: :new
  end

  resources :arts, only: ["show", "index"] do
    member  do
      post :cart
    end
    member do
      post "toggle_favorite", to: "arts#toggle_favorite"
    end
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :arts, only: [:update, :destroy]

end
