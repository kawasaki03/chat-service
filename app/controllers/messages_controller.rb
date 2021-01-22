class MessagesController < ApplicationController
  before_action :authenticate_student!
  
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.includes(:student)
  end


  def create
    @room= Room.find(params[:room_id])
    @message= Message.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content,:image).merge(room_id: params[:room_id],student_id: current_student.id)
  end
end
