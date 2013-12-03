class DropPledges < ActiveRecord::Migration
  def up
  	drop_table :pledges
  end

  def down
  end
end
