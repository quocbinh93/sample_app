module ApplicationCable
  class ChatChannel < ApplicationCable::Channel
    def subscribed
      chat_room = ChatRoom.find(params[:room_id])
      stream_for chat_room
    end

    def unsubscribed
      stop_all_streams
    end

    def speak(data)
      chat_room = ChatRoom.find(data['room_id'])
      message = chat_room.messages.create!(
        content: data['message'],
        user: current_user
      )

      ChatChannel.broadcast_to(chat_room, {
        message: render_message(message)
      })
    end

    private

    def render_message(message)
      ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: { message: message }
      )
    end
  end
end
