class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true

  validates :user_id, presence: true
  validates :reaction_type, presence: true
  
  enum reaction_type: {
    like: 'like',
    heart: 'heart',
    laugh: 'laugh',
    sad: 'sad',
    angry: 'angry'
  }
end
