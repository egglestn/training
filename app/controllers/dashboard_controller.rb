class DashboardController < ApplicationController
  def index
    @users = User.all
    @programmes = Programme.where(user_id: current_user.id) if current_user
  end
end

