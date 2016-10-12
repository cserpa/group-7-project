class AddCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizations do |t|
      t.belongs_to :figure
      t.belongs_to :category
    end
  end
end
