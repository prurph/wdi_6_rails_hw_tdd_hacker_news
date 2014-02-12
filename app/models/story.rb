class Story < ActiveRecord::Base
  validates :title, :link, presence: true
  validates :link, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  def vote_score
    blk = lambda { |vote| vote.value }
    self.votes.to_a.sum(&blk)
  end

  def hot
    x = self.vote_score
    if x > 0
      y = 1
    elsif x == 0
      y = 0
    else
      y = -1
    end

    Math.log([x.abs, 1].max, 10) + y * self.created_at.to_i / 45000
  end

  def self.top_30
    self.all.sort_by(&:hot).reverse[0,30]
  end
end
