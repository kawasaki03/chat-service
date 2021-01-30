class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Teacher
      teacher_path(current_teacher.id)
    when Student
      student_path(current_student.id)
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :name, :teacher_id, :status_message, :image])
  end
end
