class User < ActiveRecord::Base
  validates :username, uniqueness: true
  has_many :stories
  has_many :comments
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
