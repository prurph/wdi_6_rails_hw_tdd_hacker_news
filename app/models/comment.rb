class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :story_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :story
end
