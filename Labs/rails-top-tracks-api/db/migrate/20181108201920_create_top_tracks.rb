class CreateTopTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :top_tracks do |t|
      t.string :track_name
      t.string :album_name
      t.integer :personal_ranking

      t.timestamps
    end
  end
end
