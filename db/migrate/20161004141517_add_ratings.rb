class AddRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rating, null: false
      t.text :review
      t.belongs_to :user, null: false
      t.belongs_to :figure, null: false
    end  
  end
end
