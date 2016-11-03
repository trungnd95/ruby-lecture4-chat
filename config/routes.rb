Rails.application.routes.draw do
  root 'rooms#index'
  get 'logout' => 'home#logout'
  post 'login' => 'home#login'
  resources :rooms do
    resources :messages
  end
  mount ActionCable.server => '/cable'
end
