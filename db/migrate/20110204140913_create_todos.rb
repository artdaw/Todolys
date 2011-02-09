class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :description
      t.integer :estimation
      t.datetime :due_date
      t.boolean :completed
      t.references :list

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
