# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_24_111417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "plateNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graphs", force: :cascade do |t|
    t.json "adjacencyList"
    t.json "nodeOccupancy"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "action"
    t.string "carPlate"
    t.string "node"
    t.string "parkedCar"
    t.string "parkingSize"
    t.string "entryTime"
    t.float "costPaidAlready"
    t.string "recentEntryTime"
    t.float "totalBill"
    t.string "exitTime"
    t.bigint "graph_id", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_logs_on_car_id"
    t.index ["graph_id"], name: "index_logs_on_graph_id"
  end

  add_foreign_key "logs", "cars"
  add_foreign_key "logs", "graphs"
end
