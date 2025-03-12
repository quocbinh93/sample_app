class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :set_chat_room
  before_action :set_message, only: [:update, :destroy]

  def create
    @message = @chat_room.messages.build(message_params)
    @message.user = current_user
    
    if @message.save
      respond_to do |format|
        format.html { redirect_to @chat_room }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @chat_room, alert: 'Failed to send message.' }
        format.js
      end
    end
  end

  def update
    if @message.user == current_user && @message.update(message_params)
      ChatChannel.broadcast_to(@chat_room, {
        message_id: @message.id,
        content: @message.content,
        edited: true,
        edited_at: @message.edited_at
      })
      head :ok
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @message.user == current_user
      @message.destroy
      ChatChannel.broadcast_to(@chat_room, {
        message_id: @message.id,
        action: 'delete'
      })
      head :ok
    end
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def set_message
    @message = @chat_room.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
