class Story < ActiveRecord::Base

  validates :title, :link, :user_id, presence: true
  validates :link, uniqueness: true, uri: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  delegate :username, to: :user

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

    45000*(Math.log([x.abs, 1].max, 10)) + y * (self.created_at - Time.new(2005, 12, 8,
      7, 46, 43))
  end

  def self.top_30
    Rails.cache.fetch("top_30", expires_in: 5.minutes) do
      return all.sort_by(&:hot).reverse[0,30]
    end
  end

  def user_voted_value(user_id)
    value = self.votes.where(user_id: user_id).pluck(:value)
    value.empty? ? 0 : value
  end
end
