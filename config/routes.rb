Rails.application.routes.draw do
  devise_for :artists
  get 'arts/show'
  get 'artists/show'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :artists, only: ["show"] do
    resources :arts, only: ["new", "create"]
  end
  resources :arts, only: ["show"]
end
