class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.integer :album_id, null: false
      t.string :kind, null: false
      t.string :lyric, null: false

      t.timestamps null: false
    end

    add_index :tracks, :album_id
  end
end
