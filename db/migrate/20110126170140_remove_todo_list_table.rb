class RemoveTodoListTable < ActiveRecord::Migration
  def self.up
    drop_table :todo_lists
  end

  def self.down
    drop_table :todo_lists
  end
end
