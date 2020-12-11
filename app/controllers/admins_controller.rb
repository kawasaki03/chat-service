class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @users = User.where(admin_id: current_admin.id)
  end

  def edit
  end
end