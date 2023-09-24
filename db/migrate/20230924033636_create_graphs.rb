class CreateGraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :graphs do |t|
      t.json :adjacencyList
      t.json :nodeOccupancy
      t.string :name, null: false

      t.timestamps
    end
  end
end
