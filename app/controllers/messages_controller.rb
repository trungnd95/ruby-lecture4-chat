class MessagesController < ApplicationController
  before_action :require_user!
  def index
    load_room
    @messages = @room.messages
    respond_to do |format|
      format.json{render json: @messages}
      format.html
      format.js
    end
  end

  def create
    load_room
    @message = @room.messages.build messages_params
    @message.username =  session[:username]
    # respond_to do |format|
    #   if @message.save
    #     format.html  do
    #       redirect_to room_messages_path(@room)
    #     end
    #   else
    #     format.html do
    #       flash[:error] =  "Error: #{@message.errors.full_messages.to_sentence}"
    #       redirect_to :back
    #     end
    #   end
    #   format.js
    @message.save!
    ActionCable.server.broadcast 'messages', message: render_message(@message)
    head :ok
    # end

  end

  private
  def load_room
    @room = Room.find_by id: params[:room_id]
  end

  def messages_params
    params.require(:message).permit :room_id, :content, :username
  end

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: Message.last}
  end
end
