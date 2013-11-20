class SetDefaultToRankUsers < ActiveRecord::Migration
  def up
	change_column :users, :rank, :boolean, default: 'false'
  end

  def down
  end
end
