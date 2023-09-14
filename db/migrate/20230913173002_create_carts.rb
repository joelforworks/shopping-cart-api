class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.json :product_ids
      t.json :event_ids

      t.timestamps
    end
  end
end
