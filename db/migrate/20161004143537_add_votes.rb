# frozen_string_literal: true
class AddVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :rating
    end
  end
end
