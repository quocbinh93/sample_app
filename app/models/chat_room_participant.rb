class ChatRoomParticipant < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  validates :chat_room_id, uniqueness: { scope: :user_id }
end