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
    ratings = Rating.where(figure_id: self.id)
    average_rating = nil
    sum = 0
    ratings.each do |rating|
      sum += rating.rating
    end
    average_rating = sum.to_f / ratings.length
  end
end
