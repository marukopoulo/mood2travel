class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :value

      t.timestamps
    end
  end
end
