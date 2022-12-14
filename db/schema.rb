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

ActiveRecord::Schema[7.0].define(version: 2022_10_10_023229) do
  create_table "cargos", force: :cascade do |t|
    t.string "funcao"
    t.integer "salario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donos", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "cnpj"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_donos_on_email", unique: true
    t.index ["reset_password_token"], name: "index_donos_on_reset_password_token", unique: true
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.date "nascimento"
    t.string "email"
    t.integer "cargo_id", null: false
    t.integer "dono_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_funcionarios_on_cargo_id"
    t.index ["dono_id"], name: "index_funcionarios_on_dono_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "produto"
    t.integer "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "cliente_id", null: false
    t.integer "quantidade"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
    t.index ["item_id"], name: "index_pedidos_on_item_id"
  end

  add_foreign_key "funcionarios", "cargos"
  add_foreign_key "funcionarios", "donos"
  add_foreign_key "pedidos", "clientes"
  add_foreign_key "pedidos", "items"
end
