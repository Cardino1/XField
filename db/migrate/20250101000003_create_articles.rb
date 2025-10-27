# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.text :content, null: false
      t.date :published_on, null: false
      t.string :hero_image_url

      t.timestamps
    end
  end
end
