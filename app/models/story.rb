class Story < ActiveRecord::Base
  validates :title, :link, presence: true
  validates :link, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments
end
