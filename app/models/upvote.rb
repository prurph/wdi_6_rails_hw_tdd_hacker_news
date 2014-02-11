class Upvote < ActiveRecord::Base
  validates :user_id, presence: true
  validates :story_id, presence: true

  validates :user_id, uniqueness: true
  validates :story_id, uniqueness: true

  belongs_to :story
  belongs_to :user
end
