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

ActiveRecord::Schema.define(version: 20161120115331) do

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "active"
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_api_keys_on_key", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_applications_on_name"
  end

  create_table "artefact_filters", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["key"], name: "index_artefact_filters_on_key"
  end

  create_table "artefact_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["application_id", "name"], name: "index_artefact_types_on_application_id_and_name", unique: true
    t.index ["name"], name: "index_artefact_types_on_name"
  end

  create_table "artefact_versions", force: :cascade do |t|
    t.integer  "artefact_id"
    t.string   "version"
    t.integer  "version_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["artefact_id", "version_number"], name: "index_artefact_versions_on_artefact_id_and_version_number", unique: true
    t.index ["artefact_id"], name: "index_artefact_versions_on_artefact_id"
  end

  create_table "artefacts", force: :cascade do |t|
    t.string   "name"
    t.integer  "artefact_type_id"
    t.integer  "artefact_version_id"
    t.integer  "application_id"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["application_id", "name"], name: "index_artefacts_on_application_id_and_name", unique: true
    t.index ["application_id"], name: "index_artefacts_on_application_id"
    t.index ["name"], name: "index_artefacts_on_name"
  end

  create_table "configurations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "key"], name: "index_configurations_on_user_id_and_key", unique: true
    t.index ["user_id"], name: "index_configurations_on_user_id"
  end

  create_table "deployments", force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "artefact_id"
    t.integer  "artefact_version_id"
    t.integer  "environment_id"
    t.text     "notes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["artefact_id", "artefact_version_id", "environment_id"], name: "index_deployments_on_artefact_artefactversion_environment", unique: true
    t.index ["artefact_id", "artefact_version_id"], name: "index_deployments_on_artefact_id_and_artefact_version_id"
    t.index ["artefact_id", "environment_id"], name: "index_deployments_on_artefact_id_and_environment_id"
    t.index ["artefact_id"], name: "index_deployments_on_artefact_id"
    t.index ["environment_id"], name: "index_deployments_on_environment_id"
  end

  create_table "environment_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_environment_groups_on_name", unique: true
  end

  create_table "environments", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_environments_on_name", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.integer  "environment_group_id"
    t.integer  "environment_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id", "application_id"], name: "index_permissions_on_user_id_and_application_id"
    t.index ["user_id", "environment_group_id"], name: "index_permissions_on_user_id_and_environment_group_id"
    t.index ["user_id", "environment_id"], name: "index_permissions_on_user_id_and_environment_id"
    t.index ["user_id", "key"], name: "index_permissions_on_user_id_and_key"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "source_vcs", force: :cascade do |t|
    t.integer  "repository_id"
    t.string   "branch"
    t.string   "tag"
    t.string   "revision"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "source_vcs_repositories", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "name"
    t.string   "shortname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_source_vcs_repositories_on_name"
  end

  create_table "source_vcs_servers", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "user"
    t.string   "password"
    t.integer  "vcs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "type"
    t.integer  "artefact_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_applications", force: :cascade do |t|
    t.string   "user_id"
    t.string   "application_id"
    t.text     "environment_spec"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id", "application_id"], name: "index_user_applications_on_user_id_and_application_id", unique: true
    t.index ["user_id"], name: "index_user_applications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
