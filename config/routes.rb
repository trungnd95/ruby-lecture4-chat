Rails.application.routes.draw do
  root 'rooms#index'
  get 'logout' => 'home#logout'
  post 'login' => 'home#login'
  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
