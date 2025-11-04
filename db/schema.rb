ActiveRecord::Schema[8.0].define(version: 2025_11_03_133037) do
  enable_extension "pg_catalog.plpgsql"

  create_table "excavators", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.string "company_name"
    t.string "address"
    t.boolean "crew_on_site", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.string "sequence_number"
    t.string "request_type"
    t.datetime "response_due_date_time"
    t.string "primary_service_area_code"
    t.string "additional_service_area_codes"
    t.text "well_known_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "excavators", "tickets"
end
