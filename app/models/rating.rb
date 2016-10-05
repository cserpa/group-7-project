# frozen_string_literal: true
class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :figure

  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :review, allow_nil: true, length: { maximum: 140 }

  RATINGS = [
    [0, '0'],
    [1, '1'],
    [2, '2'],
    [3, '3'],
    [4, '4'],
    [5, '5']
  ]
end
