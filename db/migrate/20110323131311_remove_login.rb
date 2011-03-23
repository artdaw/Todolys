class RemoveLogin < ActiveRecord::Migration
  def self.up
     change_table "users" do |t|
       t.remove :username
     end
  end

  def self.down
    change_table "users" do |t|
      t.string :username
    end
  end
end
