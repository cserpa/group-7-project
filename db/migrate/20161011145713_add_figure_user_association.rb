class AddFigureUserAssociation < ActiveRecord::Migration[5.0]
  def change
    add_column :figures, :user_id, :integer, null: false
  end
end
