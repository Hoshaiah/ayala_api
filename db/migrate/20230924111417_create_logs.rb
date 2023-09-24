class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :action
      t.string :carPlate
      t.string :node
      t.string :parkedCar
      t.string :parkingSize
      t.string :entryTime
      t.float :costPaidAlready
      t.string :recentEntryTime
      t.float :totalBill
      t.string :exitTime
      t.references :graph, null: false, foreign_key: true

      t.timestamps
    end
  end
end
