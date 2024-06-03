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

ActiveRecord::Schema[7.1].define(version: 2024_04_21_192151) do
# Could not dump table "active_storage_attachments" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "active_storage_blobs" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "active_storage_variant_records" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "comments" because of following StandardError
#   Unknown type '' for column 'id'

# Could not dump table "post_tags" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "posts" because of following StandardError
#   Unknown type '' for column 'user_id'

# Could not dump table "tags" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "texts" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "users" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "posts", "users"
end
