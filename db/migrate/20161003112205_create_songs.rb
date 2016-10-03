class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.string :track
      t.integer :duration
      t.references :artist, index: true
      t.references :album, index: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :songs
  end
end
