class AddAddressToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :address, :string
  end
end
