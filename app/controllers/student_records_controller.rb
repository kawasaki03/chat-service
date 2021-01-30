class StudentRecordsController < ApplicationController
  before_action :private_info
  before_action :authenticate_teacher!

  def index
    @student = Student.find(params[:id])
    @student_record = StudentRecord.new
    # @student_records = @student.includes()
    # @student_records = StudentRecord.where(student_id: params[:id])
  end

  def create
    @student = Student.find(params[:id])
    @student_record = StudentRecord.new(student_record_params)
    if @student_record.save
      redirect_to student_records_path
    else
      render :index
    end
  end

  private

  def student_record_params
    params.require(:student_record).permit(:title, :note).merge(student_id: params[:id], teacher_id: current_teacher.id)
  end

  def private_info
    @student = Student.find(params[:id])
    redirect_to root_path if teacher_signed_in? && !(@student.teacher_id == current_teacher.id)
  end
end
