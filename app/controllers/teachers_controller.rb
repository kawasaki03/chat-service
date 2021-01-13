class TeachersController < ApplicationController
  before_action :authenticate_teacher!
  
  def show
    @students = Student.where(teacher_id: current_teacher.id)
  end

  def edit
  end

  def update
    if current_teacher.update(teacher_params)
      redirect_to teacher_path(current_teacher)
    else 
      render :edit
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name,:email,:image,:status_message)
  end
end