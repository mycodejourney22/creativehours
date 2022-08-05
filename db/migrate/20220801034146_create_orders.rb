class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :checkout_session_id
      t.references :artist, null: false, foreign_key: true
      t.string :cart, array: true, default: []

      t.timestamps
    end
  end
end
