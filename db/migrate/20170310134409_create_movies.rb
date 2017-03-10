class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id, null: :false
      t.string :title, null: :false
      t.string :overview
      t.string :release_date
      t.integer :popularity
      t.integer :vote_count
      t.integer :vote_average

      t.timestamps
    end
    add_index :movies, :tmdb_id, unique: true
    add_index :movies, :overview
  end
end
