class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end  

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User registered successfully."
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
    flash[:notice] = "User information updated succesfully"
    redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User deleted succesfully"
    redirect_to users_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end
end