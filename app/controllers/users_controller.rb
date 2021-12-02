class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:alert] = "user #{@user.name} updated"
      redirect_to home_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #direct login after signing process
      session[:user_id] = @user.id
      @user_name = cookies[:user_name]

      #alert for succesful user creation
      flash[:alert] = "User #{@user.name} signed up succesfully"
      redirect_to home_path 
    else
      render :new
    end
  end
  
  def show
  end

  def home
  end

  def newhome
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
