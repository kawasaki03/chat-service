class ApplicationController < ActionController::Base
  before_action :authenticate_any!
before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_path(current_admin.id)
  when User
    user_path(current_user.id)
  end
end

private
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:admin_id])
end

def authenticate_any!
  if user_signed_in?
  elsif authenticate_admin!
  end
end




end
