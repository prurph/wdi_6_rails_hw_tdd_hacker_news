class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :story_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :story
  has_many :votes, as: :votable

  def vote_score
    self.votes.sum{|vote| vote.value}
  end
end
