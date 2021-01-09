class ContactsController < ApplicationController
  def index
    @admin_room = AdminRoom.find(params[:admin_room_id])
    @contact = Contact.new
    @contacts = @admin_room.contacts
  end


  def create
    @admin_room= AdminRoom.find(params[:admin_room_id])
    @contact = Contact.new(contact_params)
    if admin_signed_in?
      @contact.is_user = false
    elsif user_signed_in?
      @contact.is_user = true
    end
    @contact.admin_room_id = @admin_room.id

   
    if @contact.save
      redirect_to admin_room_contacts_path(params[:admin_room_id])
    else
      render :index
    end
  end

  private
  def contact_params    
    params.require(:contact).permit(:content)
  end
end