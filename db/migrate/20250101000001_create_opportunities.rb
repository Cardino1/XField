# frozen_string_literal: true

class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities do |t|
      t.string :opportunity_type, null: false
      t.string :title, null: false
      t.string :full_name, null: false
      t.string :organization, null: false
      t.text :description, null: false
      t.string :link, null: false
      t.boolean :approved, default: false, null: false

      t.timestamps
    end

    add_index :opportunities, :opportunity_type
    add_index :opportunities, :approved
  end
end
