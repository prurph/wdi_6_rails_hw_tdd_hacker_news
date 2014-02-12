class Vote < ActiveRecord::Base
  validates :user_id, presence: true

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type],
    message: "already voted!"}

  belongs_to :user
  belongs_to :votable, polymorphic: true

end
