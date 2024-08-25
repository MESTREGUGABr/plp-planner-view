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

ActiveRecord::Schema[7.1].define(version: 8) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atividades", force: :cascade do |t|
    t.string "name"
    t.string "descricao"
    t.integer "prioridade"
    t.date "data"
    t.bigint "status_id", null: false
    t.bigint "planner_view_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_view_id"], name: "index_atividades_on_planner_view_id"
    t.index ["status_id"], name: "index_atividades_on_status_id"
  end

  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lembretes", force: :cascade do |t|
    t.date "data"
    t.string "descricao"
    t.bigint "tarefa_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tarefa_id"], name: "index_lembretes_on_tarefa_id"
  end

  create_table "meta", force: :cascade do |t|
    t.date "data_inicio"
    t.date "data_fim"
    t.string "descricao"
    t.bigint "status_id", null: false
    t.bigint "categoria_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_meta_on_categoria_id"
    t.index ["status_id"], name: "index_meta_on_status_id"
  end

  create_table "planner_views", force: :cascade do |t|
    t.string "nome"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_planner_views_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarefas", force: :cascade do |t|
    t.date "data"
    t.string "descricao"
    t.integer "bloco"
    t.bigint "atividade_id", null: false
    t.bigint "status_id", null: false
    t.bigint "categoria_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atividade_id"], name: "index_tarefas_on_atividade_id"
    t.index ["categoria_id"], name: "index_tarefas_on_categoria_id"
    t.index ["status_id"], name: "index_tarefas_on_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atividades", "planner_views"
  add_foreign_key "atividades", "statuses"
  add_foreign_key "lembretes", "tarefas"
  add_foreign_key "meta", "categoria", column: "categoria_id"
  add_foreign_key "meta", "statuses"
  add_foreign_key "planner_views", "users"
  add_foreign_key "tarefas", "atividades"
  add_foreign_key "tarefas", "categoria", column: "categoria_id"
  add_foreign_key "tarefas", "statuses"
end
