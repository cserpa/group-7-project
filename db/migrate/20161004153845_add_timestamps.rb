# frozen_string_literal: true
class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column(:figures, :created_at, :datetime)
    add_column(:figures, :updated_at, :datetime)

    add_column(:ratings, :created_at, :datetime)
    add_column(:ratings, :updated_at, :datetime)

    add_column(:categories, :created_at, :datetime)
    add_column(:categories, :updated_at, :datetime)

    add_column(:categorizations, :created_at, :datetime)
    add_column(:categorizations, :updated_at, :datetime)

    add_column(:votes, :created_at, :datetime)
    add_column(:votes, :updated_at, :datetime)
  end
end
