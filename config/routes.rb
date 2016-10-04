Rails.application.routes.draw do
  resources :supermarkets, only: [:index, :show, :create, :update, :destroy] do
    resources :products, only: [:index, :show, :create, :update, :destroy]
  end
end
