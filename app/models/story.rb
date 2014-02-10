class Story < ActiveRecord::Base
  validates :title, :link, presence: true
  validates :link, uniqueness: true

  belongs_to :user
end
