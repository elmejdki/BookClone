class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.distinct
  end

  def intialize_room
    rooms = Room.joins(messages: :user).where(users: { id: current_user.id }) & Room.joins(messages: :user).where(users: { id: params[:id] })

    room = nil;

    if rooms.empty?
      room = Room.new
      room.create
  
      Message.create(user_id: current_user.id, room_id: @room.id, body: '', unread_messages: 0)
      Message.create(user_id: params[:id], room_id: @room.id, body: '', unread_messages: 0)
    else
      room = rooms[0]
    end

    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @rooms = current_user.rooms.distinct
    render 'index'
  end
end
