class AddPriceToArts < ActiveRecord::Migration[7.0]
  def change
    add_monetize :arts, :price, currency: { present: false }
  end
end
