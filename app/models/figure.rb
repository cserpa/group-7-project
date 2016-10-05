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


end
