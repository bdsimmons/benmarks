class Topic < ActiveRecord::Base
  validates :name, presence: true

  has_many :benmark_topics
  has_many :benmarks, through: :benmark_topics
end
