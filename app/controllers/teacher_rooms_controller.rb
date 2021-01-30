class TeacherRoomsController < ApplicationController
  before_action :authenticate_any!

  def index
  end

  def new
    @teacher_room = TeacherRoom.new
  end

  def create
    @teacher_room = TeacherRoom.new(teacher_room_params)
    if @teacher_room.save
      redirect_to teacher_rooms_path
    else
      render :new
    end
  end

  def destroy
    @teacher_room = TeacherRoom.find(params[:id])
    @teacher_room.destroy
    redirect_to teacher_rooms_path
  end

  private

  def teacher_room_params
    if teacher_signed_in?
      params.require(:teacher_room).permit(:name, :student_id).merge(teacher_id: current_teacher.id)
    elsif student_signed_in?
      params.require(:teacher_room).permit(:name, :teacher_id).merge(student_id: current_student.id)
    end
  end

  def authenticate_any!
    if student_signed_in?
    elsif authenticate_teacher!
    end
  end
end
