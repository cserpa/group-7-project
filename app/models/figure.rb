# frozen_string_literal: true
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
    ratings = self.ratings
    sum = 0
    ratings.each do |rating|
      sum += rating.rating
    end
    average_rating = sum.to_f / ratings.length
  end

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
