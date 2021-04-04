Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Signup, login, and user account
  resources :users
  get "/signup", to: "users#new"
end
