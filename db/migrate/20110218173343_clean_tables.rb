class CleanTables < ActiveRecord::Migration
  def self.up
    drop_table "comments"
    drop_table "lists"
    drop_table "posts"
    drop_table "tags"
    drop_table "todos"
    drop_table "users"
    
    create_table "users", :force => true do |t|
      t.string   "username"
      t.string   "email"
      t.string   "crypted_password"
      t.string   "password_salt"
      t.string   "persistence_token"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    create_table "todos", :force => true do |t|
      t.string   "description"
      t.integer  "estimation"
      t.datetime "due_date"
      t.boolean  "completed"
      t.integer  "list_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    create_table "lists", :force => true do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end

  def self.down
    
  end
end
