class TodoCompletedDefalut < ActiveRecord::Migration
  def self.up
    change_column :todos, :completed, :boolean, :default => :false
  end

  def self.down
    change_column :todos, :completed, :boolean, :default => "", :null => true
  end
end
