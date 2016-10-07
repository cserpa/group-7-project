class Figure < ActiveRecord::Base
  has_many :ratings
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
  validates :occupation, presence: true
  validates :nationality, presence: true
  validates :era, presence: true
  validates :claim_to_fame, presence: true

  def average_rating
    if self.ratings.empty? then return nil end
    sum = self.ratings.reduce(0){|memo, rating| memo += rating.rating}
    average_rating = sum.to_f / self.ratings.length
    average_rating.round(2)
  end
end
