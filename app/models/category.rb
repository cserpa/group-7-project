# frozen_string_literal: true
class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :figures, through: :categorizations


  validates :name, presence: true

end
