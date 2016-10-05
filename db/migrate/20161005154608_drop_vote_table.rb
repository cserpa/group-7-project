# frozen_string_literal: true
class DropVoteTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :votes
  end
end
