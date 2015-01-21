class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :videoId
      t.string :youtubeID
      t.string :city
      t.string :country
      t.integer :hour
      t.integer :minute
      t.string :director
      t.string :directorUrl
      t.string :walker
      t.string :walkerUrl

      t.timestamps
    end
  end
end
