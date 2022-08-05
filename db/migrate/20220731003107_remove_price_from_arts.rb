class RemovePriceFromArts < ActiveRecord::Migration[7.0]
  def change
    remove_column :arts, :price, :integer
  end
end
