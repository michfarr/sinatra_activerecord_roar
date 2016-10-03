class CreateAlbums < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.integer :release_year
      t.integer :duration
      t.references :artist, index: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :albums
  end
end
