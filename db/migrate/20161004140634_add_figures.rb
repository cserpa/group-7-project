# frozen_string_literal: true
class AddFigures < ActiveRecord::Migration[5.0]
  def change
    create_table :figures do |t|
      t.string :name, null: false
      t.string :occupation, null: false
      t.string :era, null: false
      t.string :nationality, null: false
      t.string :claim_to_fame, null: false
    end  
  end
end
