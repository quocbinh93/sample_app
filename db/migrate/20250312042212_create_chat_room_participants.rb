class CreateChatRoomParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_room_participants do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :chat_room_participants, [:user_id, :chat_room_id], unique: true
  end
end
