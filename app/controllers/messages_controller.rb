class MessagesController < ApplicationController
  def index
    load_room
    @messages = @room.messages
  end

  def create
    load_room
    @message = @room.messages.build messages_params
    if @message.save
      redirect_to room_messages_path(@room)
    else
      flash[:error] =  "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_to :back
    end
  end

  private
  def load_room
    @room = Room.find_by id: params[:room_id]
  end

  def messages_params
    params.require(:message).permit :room_id, :content, :username
  end
end
