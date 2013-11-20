class RemoveRankFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :rank
      end

  def down
    add_column :users, :rank, :integer
  end
end
