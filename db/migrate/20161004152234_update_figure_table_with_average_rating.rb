# frozen_string_literal: true
class UpdateFigureTableWithAverageRating < ActiveRecord::Migration[5.0]
  def change
    add_column :figures, :average_rating, :float
  end
end
