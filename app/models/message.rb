class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  validates :content, presence: true

  after_update :mark_as_edited, if: :content_changed?

  private

  def mark_as_edited
    update_columns(edited: true, edited_at: Time.current)
  end
end