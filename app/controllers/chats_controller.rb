class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_rooms = current_user.user_rooms
    my_room_ids = []

    @current_user_rooms.includes([:room]).each do | ur |
      my_room_ids << ur.room.id
    end

    # @another_chats = Chat.where(room_id: my_room_ids).where.not(user_id: current_user.id)
    @another_user_rooms = UserRoom.where(room_id: my_room_ids).includes([:user]).where.not(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_room.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    else
      @room = user_room.room
    end
    @chats = @room.chats.includes([:user])
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @room = @chat.room
      if @chat.save
        @chat.create_notification_chat(current_user, @room)
      end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end
end
