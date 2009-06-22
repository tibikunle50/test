# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "chunk_versions", :force => true do |t|
    t.integer  "chunk_id"
    t.integer  "version"
    t.integer  "base_version"
    t.binary   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
  end

  add_index "chunk_versions", ["chunk_id"], :name => "chunk_versions_chunk_id_index"
  add_index "chunk_versions", ["version"], :name => "chunk_versions_version_index"

  create_table "chunks", :force => true do |t|
    t.string  "description"
    t.integer "live_version"
    t.integer "mime_type_id"
    t.string  "mime_type_str", :limit => 100, :default => ""
  end

  add_index "chunks", ["mime_type_id"], :name => "chunks_mime_type_id_index"

  create_table "file_extensions", :force => true do |t|
    t.string  "extension"
    t.integer "mime_type_id"
  end

  add_index "file_extensions", ["mime_type_id"], :name => "file_extensions_mime_type_id_index"

  create_table "mapping_labels", :force => true do |t|
    t.integer "site_mapping_id"
    t.string  "name"
    t.string  "value"
  end

  add_index "mapping_labels", ["site_mapping_id"], :name => "mapping_labels_site_mapping_id_index"

  create_table "mime_types", :force => true do |t|
    t.string "mime_type"
    t.string "description"
  end

  add_index "mime_types", ["mime_type"], :name => "mime_types_mime_type_index"

  create_table "site_mappings", :force => true do |t|
    t.string   "path_segment", :default => "",    :null => false
    t.integer  "chunk_id"
    t.integer  "version"
    t.datetime "updated_at"
    t.integer  "root_id"
    t.integer  "parent_id"
    t.integer  "depth"
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "is_internal",  :default => false
  end

  add_index "site_mappings", ["chunk_id"], :name => "site_mappings_chunk_id_index"
  add_index "site_mappings", ["path_segment", "version"], :name => "site_mappings_path_segment_index"
  add_index "site_mappings", ["parent_id"], :name => "site_mappings_parent_id_index"
  add_index "site_mappings", ["lft", "rgt"], :name => "site_mappings_lft_index"
  add_index "site_mappings", ["depth"], :name => "site_mappings_depth_index"

  create_table "users", :force => true do |t|
    t.string   "first_name",               :default => "", :null => false
    t.string   "last_name",                :default => "", :null => false
    t.string   "email",                    :default => "", :null => false
    t.string   "password",   :limit => 40, :default => "", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
