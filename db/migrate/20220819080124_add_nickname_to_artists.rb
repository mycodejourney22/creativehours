class AddNicknameToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :nickname, :string
  end
end
