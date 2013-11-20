class AddRankBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rank, :boolean

  end
end
