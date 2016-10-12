class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :figure
  has_many :votes

  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :review, allow_nil: true, length: { maximum: 140 }

  RATINGS = [
    [0, '0'],
    [1, '1'],
    [2, '2'],
    [3, '3'],
    [4, '4'],
    [5, '5']
  ].freeze

  def get_total_votes
    self.votes.reduce(0){ |memo, vote| memo += vote.value }
  end
end
