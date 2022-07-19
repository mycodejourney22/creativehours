class CreateArts < ActiveRecord::Migration[7.0]
  def change
    create_table :arts do |t|
      t.string :image_url
      t.text :description
      t.integer :price
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
