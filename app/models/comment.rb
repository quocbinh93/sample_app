class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  belongs_to :parent_comment, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id", dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
  has_many :reacting_users, through: :reactions, source: :user
  
  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  
  default_scope -> { order(created_at: :desc) }
end
