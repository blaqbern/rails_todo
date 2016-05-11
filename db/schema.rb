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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150411015458) do

  create_table "accounts", :force => true do |t|
    t.string   "gender"
    t.string   "age"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "tag_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags_todo_items", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "todo_item_id"
  end

  add_index "tags_todo_items", ["tag_id"], :name => "index_tags_todo_items_on_tag_id"
  add_index "tags_todo_items", ["todo_item_id"], :name => "index_tags_todo_items_on_todo_item_id"

  create_table "todo_items", :force => true do |t|
    t.date     "due_date"
    t.string   "task_title"
    t.string   "description"
    t.integer  "todo_list_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "done"
  end

  add_index "todo_items", ["todo_list_id"], :name => "index_todo_items_on_todo_list_id"

  create_table "todo_lists", :force => true do |t|
    t.string   "list_name"
    t.date     "list_due_date"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "todo_lists", ["user_id"], :name => "index_todo_lists_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
