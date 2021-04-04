class UsersController < ApplicationController

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

  def show
    @user = User.find(params[:id])
  end
end
