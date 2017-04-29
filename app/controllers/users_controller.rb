class UsersController < ApplicationController
  def edit; end

  def index
    @users = User.all
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: t('.success.update', name: current_user.email)
    else
      render :edit
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :role
    )
  end
end
