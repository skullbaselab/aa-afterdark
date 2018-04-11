# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
  end

  add_index "actors", ["name"], name: "actor_name", using: :btree

  create_table "albums", primary_key: "asin", force: :cascade do |t|
    t.string  "title",  limit: 50
    t.string  "artist", limit: 50
    t.decimal "price",             precision: 10, scale: 2
    t.date    "rdate"
    t.string  "label",  limit: 50
    t.integer "rank"
  end

  create_table "castings", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.integer "ord"
  end

  add_index "castings", ["actor_id"], name: "casting_actor", using: :btree
  add_index "castings", ["movie_id"], name: "casting_movie", using: :btree
  add_index "castings", ["ord"], name: "casting_ord", using: :btree

  create_table "countries", primary_key: "name", force: :cascade do |t|
    t.string  "continent"
    t.integer "area"
    t.integer "population", limit: 8
    t.integer "gdp",        limit: 8
  end

  create_table "depts", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string  "title"
    t.integer "yr"
    t.float   "score"
    t.integer "votes"
    t.integer "director_id"
  end

  add_index "movies", ["title"], name: "movie_title", using: :btree

  create_table "nobels", id: false, force: :cascade do |t|
    t.integer "yr"
    t.string  "subject"
    t.string  "winner"
  end

  create_table "routes", id: false, force: :cascade do |t|
    t.string  "num",     null: false
    t.string  "company", null: false
    t.integer "pos",     null: false
    t.integer "stop_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
  end

  create_table "styles", id: false, force: :cascade do |t|
    t.string "album", limit: 10,  null: false
    t.string "style", limit: 100, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "dept_id"
    t.string  "name"
    t.integer "phone"
    t.string  "mobile"
  end

  add_index "teachers", ["dept_id"], name: "teacher_dept", using: :btree

  create_table "tracks", id: false, force: :cascade do |t|
    t.string  "album", limit: 10,  null: false
    t.integer "disk",              null: false
    t.integer "posn",              null: false
    t.string  "song",  limit: 255
  end

  add_foreign_key "castings", "actors", name: "casting_actorid_fkey"
  add_foreign_key "castings", "movies", name: "casting_movieid_fkey"
  add_foreign_key "movies", "actors", column: "director_id", name: "movie_director_fkey"
  add_foreign_key "routes", "stops", name: "route_stop_fkey"
  add_foreign_key "styles", "albums", column: "album", primary_key: "asin", name: "styles_album_fkey"
  add_foreign_key "teachers", "depts", name: "teacher_dept_fkey"
  add_foreign_key "tracks", "albums", column: "album", primary_key: "asin", name: "tracks_album_fkey"
end
