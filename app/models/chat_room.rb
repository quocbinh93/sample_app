class ChatRoom < ApplicationRecord
  has_many :chat_room_participants, dependent: :destroy
  has_many :users, through: :chat_room_participants
  has_many :messages, dependent: :destroy

  def participant?(user)
    users.include?(user)
  end
end