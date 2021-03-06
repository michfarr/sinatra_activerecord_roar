# frozen_string_literal: true
class CreateArtists < ActiveRecord::Migration
  def up
    create_table :artists do |t|
      t.string :name
      t.text :history

      t.timestamps null: false
    end
  end

  def down
    drop_table :artists
  end
end
