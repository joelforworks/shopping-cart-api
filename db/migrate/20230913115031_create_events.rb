class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.decimal :price
      t.string :thumbnail
      t.text :description

      t.timestamps
    end
  end
end
