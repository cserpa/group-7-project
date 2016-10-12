class AddVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :rating, null: false
      t.belongs_to :user, null: false
      t.integer :value, null: false
    end
  end
end
