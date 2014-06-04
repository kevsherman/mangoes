class Admin::UsersController < UsersController

  def index
    if admin?
      @users = User.all
    else
      flash[:alert] = "Fuck off, you're not allowed here"
      redirect_to root_path
    end
  end

  private 
  def admin_user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :email, :admin)
  end
end
