Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/index"
  root to: "home#index"

  resources :posts do
    member do
      put :publish
      put :unpublish
    end
  end
end
