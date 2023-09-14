class AddItemsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :items, :json
  end
end
