class Benmark < ActiveRecord::Base
  belongs_to :user
  has_many :benmark_topics
  has_many :topics, through: :benmark_topics
  has_many :likes

  validates :url, presence: true, length: { minimum: 1 }
  validates :user, presence: true

end
