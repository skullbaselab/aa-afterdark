# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170816010823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circles", force: :cascade do |t|
    t.integer "circle_leader_id", null: false
    t.integer "pod_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_leader_id"], name: "index_circles_on_circle_leader_id"
    t.index ["pod_id"], name: "index_circles_on_pod_id"
  end

  create_table "developers", force: :cascade do |t|
    t.integer "student_pod_id"
    t.integer "student_circle_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_pod_id"], name: "index_developers_on_student_pod_id"
  end

  create_table "final_projects", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "supervisor_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_final_projects_on_student_id"
    t.index ["supervisor_id"], name: "index_final_projects_on_supervisor_id"
  end

  create_table "pods", force: :cascade do |t|
    t.integer "pod_leader_id", null: false
    t.string "name", null: false
    t.integer "coolness_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pod_leader_id"], name: "index_pods_on_pod_leader_id"
  end

  create_table "teaching_assistant_memberships", force: :cascade do |t|
    t.integer "teaching_assistant_id", null: false
    t.integer "pod_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pod_id"], name: "index_teaching_assistant_memberships_on_pod_id"
    t.index ["teaching_assistant_id"], name: "index_teaching_assistant_memberships_on_teaching_assistant_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_technologies_on_name"
  end

  create_table "technology_memberships", force: :cascade do |t|
    t.integer "technology_id", null: false
    t.integer "final_project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["final_project_id"], name: "index_technology_memberships_on_final_project_id"
    t.index ["technology_id"], name: "index_technology_memberships_on_technology_id"
  end

end
