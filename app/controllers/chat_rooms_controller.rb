class ChatRoomsController < ApplicationController
  before_action :logged_in_user

  def index
    @chat_rooms = current_user.chat_rooms.includes(:users)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages.includes(:user)
    @message = Message.new
  end

  def create
    @other_user = User.find(params[:user_id])
    # Kiểm tra xem đã có chat room giữa 2 user chưa
    @chat_room = find_or_create_chat_room(@other_user)
    redirect_to @chat_room
  end

  private

  def find_or_create_chat_room(other_user)
    # Tìm chat room chung giữa current_user và other_user
    common_room = ChatRoom.joins(:chat_room_participants)
                         .where(chat_room_participants: { user_id: [current_user.id, other_user.id] })
                         .group('chat_rooms.id')
                         .having('COUNT(DISTINCT chat_room_participants.user_id) = 2')
                         .first

    return common_room if common_room

    # Nếu chưa có thì tạo mới
    ChatRoom.transaction do
      room = ChatRoom.create!
      room.chat_room_participants.create!(user: current_user)
      room.chat_room_participants.create!(user: other_user)
      room
    end
  end
end
