# frozen_string_literal: true

class CreateInvestors < ActiveRecord::Migration[7.1]
  def change
    create_table :investors do |t|
      t.string :firm_name, null: false
      t.string :contact_name
      t.string :email, null: false
      t.string :website
      t.text :values, null: false
      t.text :looking_for, null: false
      t.text :portfolio_highlights
      t.text :request_for_startups, null: false
      t.boolean :approved, default: false, null: false

      t.timestamps
    end

    add_index :investors, :approved
  end
end
