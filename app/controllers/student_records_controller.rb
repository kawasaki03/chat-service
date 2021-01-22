class StudentRecordsController < ApplicationController
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
  def  student_record_params
    params.require(:student_record).permit(:title,:note).merge(student_id: params[:id],teacher_id: current_teacher.id)
  end


end
