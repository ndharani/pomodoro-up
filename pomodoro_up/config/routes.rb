Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Sign up, log in, and user home page
  resources :users
  get "/signup", to: "users#new"
  get "/login", to: "users#login", as: "get_login"
  post "/login", to: "users#submit_login", as: "submit_login"
  post "/logout", to: "users#logout", as: "logout"

  # Task lists & tasks
  resources :task_lists do
    resources :tasks
    get "/task/:id/mark_active", to: "tasks#mark_active", as: "mark_task_active"
    get "/task/:id/mark_finished", to: "tasks#mark_finished", as: "mark_task_finished"
  end

end
