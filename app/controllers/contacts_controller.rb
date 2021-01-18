class ContactsController < ApplicationController
  before_action :authenticate_any!

  
  def index
    @teacher_room = TeacherRoom.find(params[:teacher_room_id])
    @contact = Contact.new
    @contacts = @teacher_room.contacts
  end


  def create
    binding.pry
    @teacher_room= TeacherRoom.find(params[:teacher_room_id])
    @contact = Contact.new(contact_params)
    if teacher_signed_in?
      @contact.is_student = false
    elsif student_signed_in?
      @contact.is_student = true
    end
    @contact.teacher_room_id = @teacher_room.id

   
    if @contact.save
      redirect_to teacher_room_contacts_path(params[:teacher_room_id])
    else
      render :index
    end
  end

  private
  def contact_params    
    params.require(:contact).permit(:content,:image)
  end

  def authenticate_any!
    if student_signed_in?
    elsif authenticate_teacher!
    end
  end
  

end