class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :story_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :story
  has_many :votes, as: :votable, dependent: :destroy
  delegate :username, to: :user

  def vote_score
    blk = lambda {|vote| vote.value}
    self.votes.to_a.sum(&blk)
  end

  def user_voted_value(user_id)
    value = self.votes.where(user_id: user_id).pluck(:value)
    value.empty? ? 0 : value
  end
end
