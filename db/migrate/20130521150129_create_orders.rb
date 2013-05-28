class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.datetime :date

      t.timestamps
    end
  end
end
