class TopController < ApplicationController
  def index
    @current_user = current_teacher || current_student
  end
end
