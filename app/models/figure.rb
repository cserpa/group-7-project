class Figure < ActiveRecord::Base
  has_many :ratings
  belongs_to :user

  validates :name, presence: true
  validates :occupation, presence: true
  validates :nationality, presence: true
  validates :era, presence: true
  validates :claim_to_fame, presence: true

  def average_rating
    if self.ratings.empty? then return 0 end
    sum = self.ratings.reduce(0){|memo, rating| memo += rating.rating}
    average_rating = sum.to_f / self.ratings.length
    average_rating.round(2)
  end

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
