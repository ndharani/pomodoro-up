class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  # /users
  def index
  end

  # /signup
  def new
    @user = User.new
    render "signup"
  end

  # post /signup
  def create
    credentials = {
      "username": params[:user][:username],
      "email": params[:user][:email],
      "password": params[:user][:password],
    }
    @user = User.create(credentials)
    if @user.valid?
      redirect_to user_path(@user)
    else  
      # TODO: bubble up errors on signup page
      render "signup_error"
    end
  end

  def signup_error
  end

  # /login
  def login
  end

  # post /login
  def submit_login
    email = params[:users][:email]
    password = params[:users][:password]
    user = User.find_by(email: email)
    if user
      if user.authenticate(password)
        session[:user_id] = user.id
        puts("user", user, user.id, session[:user_id])
        redirect_to user_path(user)
      else
        errors["Password Error"] = "Incorrect password for email #{email}"
        puts("Incorrect password for email #{email}")
        redirect_to get_login_path
      end
    else
      errors["User Error"] = "No user with email #{email}"
      puts("No user with email #{email}")
      redirect_to get_login_path
    end
  end

  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
