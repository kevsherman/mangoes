class Admin::UsersController < UsersController

  def index
    if admin?
      @users = User.all.page(params[:page]).per(5)
    else
      flash[:alert] = "Fuck off, only admins in the admins area!"
      redirect_to root_path
    end
  end

  private 
  def admin_user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :email, :admin)
  end
end
