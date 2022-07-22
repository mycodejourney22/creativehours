class AddLocationToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :location, :string
  end
end
