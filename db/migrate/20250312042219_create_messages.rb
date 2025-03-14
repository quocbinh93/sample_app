class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :edited, default: false
      t.datetime :edited_at

      t.timestamps
    end
  end
end
