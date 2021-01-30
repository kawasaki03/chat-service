class StudentsController < ApplicationController
  before_action :authenticate_student!, except: [:index]
  before_action :authenticate_teacher!, only: [:index]

  def show
  end

  def edit
  end

  def update
    if current_student.update(student_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def index
    @students = Student.where(teacher_id: current_teacher.id)
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :image, :status_message)
  end
end
