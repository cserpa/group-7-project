class RemoveAverageRatingFromFigures < ActiveRecord::Migration[5.0]
  def change
    remove_column :figures, :average_rating, :float
  end
end
