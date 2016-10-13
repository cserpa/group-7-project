class AddAvatarToFigures < ActiveRecord::Migration[5.0]
  def change
    add_column :figures, :avatar, :string
  end
end
