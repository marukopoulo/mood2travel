class AddThumnailUrlToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :thumnail_url, :string
  end
end
