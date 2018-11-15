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

ActiveRecord::Schema.define(version: 20181115132241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "User"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auction1s", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.float "puja"
    t.string "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctionns", force: :cascade do |t|
    t.string "puja"
    t.string "fecha"
    t.string "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.integer "Puja"
    t.integer "Precio"
    t.integer "licitacion"
    t.integer "monto"
  end

  create_table "auctions", force: :cascade do |t|
    t.integer "pujamActual"
    t.string "fecha"
    t.integer "precioMinimo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hots", force: :cascade do |t|
    t.string "sale"
    t.integer "precio"
    t.string "fecha"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nos", force: :cascade do |t|
    t.string "registred"
    t.string "User"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "premia", force: :cascade do |t|
    t.string "User"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.text "descripcion"
    t.string "nombre"
    t.string "lugar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registreds", force: :cascade do |t|
    t.string "User"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "DNI"
    t.string "contraseña"
    t.string "fechaDeNacimiento"
    t.string "email"
    t.string "datosDeTarjeta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
