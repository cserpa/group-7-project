# frozen_string_literal: true
class Categorization < ActiveRecord::Base
  belongs_to :figure
  belongs_to :category

  validates :figure_id, presence: true
  validates :category_id, presence: true
end
