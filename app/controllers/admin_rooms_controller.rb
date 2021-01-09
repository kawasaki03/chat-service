class AdminRoomsController < ApplicationController
  def index
  end

  def new
    @admin_room = AdminRoom.new
  end

  def create
    binding.pry
    @admin_room = AdminRoom.new(admin_room_params)
    if @admin_room.save
      redirect_to admin_rooms_path
    else
      render :new
    end
  end

  def destroy
    @admin_room = AdminRoom.find(params[:id])
    @admin_room.destroy
    redirect_to rooms_path
  end

  private

  def admin_room_params
    if admin_signed_in?
    params.require(:admin_room).permit(:name,:user_id).merge(admin_id: current_admin.id)
    elsif user_signed_in?
      params.require(:admin_room).permit(:name,:admin_id).merge(user_id: current_user.id)
    end
  end 

end
