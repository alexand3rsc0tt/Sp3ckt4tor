Rails.application.routes.draw do

  devise_for :admins
  root "posts#index"
  resources :posts
  get "/about", to: "static#about", as: :about

  authenticate :admin do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:index, :show]
end
