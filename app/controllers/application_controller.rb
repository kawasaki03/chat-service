class ApplicationController < ActionController::Base
  before_action :authenticate_any!
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
  devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:teacher_id,:status_message,:image])
end

def authenticate_any!
  if student_signed_in?
  elsif authenticate_teacher!
  end
end




end
