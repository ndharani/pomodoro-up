class UsersController < ApplicationController
  before_action :current_user
  before_action :logged_in?

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
    @user = User.create(signup_params)
    if @user.valid?
      # consider user logged in
      session[:user_id] = @user.id
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
    user = User.find_by(email: login_params[:email])
    if user
      if user.authenticate(login_params[:password])
        # consider user logged in
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        errors["Password Error"] = "Incorrect password for email #{email}"
        puts("Incorrect password for email #{email}")
        redirect_to get_login_path
      end
    else
      errors["User Error"] = "No user with email #{login_params[:email]}"
      puts("No user with email #{login_params[:email]}")
      redirect_to get_login_path
    end
  end

  # post /logout
  def logout
    session[:user_id] = nil
    render "logout"
  end

  # /users/:id
  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @user = nil
    end
  end

  private

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end

  def login_params
    params.require(:users).permit(:email, :password)
  end
end
