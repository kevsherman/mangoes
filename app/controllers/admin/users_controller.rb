class Admin::UsersController < ApplicationController

  def index
    if admin?
      @users = User.all.page(params[:page]).per(5)
    else
      flash[:alert] = "Fuck off, only admins in the admins area!"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)

    if @user.save
      redirect_to admin_users_path, notice: "New User Added"
    else 
      render :new_admin_user
    end
  end

  def update
    user = User.find(params[:id])
    user = user.update(admin_user_params)
    redirect_to admin_user_path
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  private 
  def admin_user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :email, :admin)
  end
end
