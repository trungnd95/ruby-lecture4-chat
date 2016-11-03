class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new room_params
    if @room.save
      redirect_to @room
    else
      flash[:error] =  "Error: #{@room.errors.full_messages.to_sentence}"
      redirect_to fallback_location: root_path
    end
  end

  private
  def room_params
    params.require(:room).permit :name
  end
end
