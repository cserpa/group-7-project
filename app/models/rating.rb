class Rating < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :figure

  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :review, allow_nil: true, length: { maximum: 140 } 


end
