class DropParticipationTable < ActiveRecord::Migration
  def up
	drop_table :participations
  end

  def down
  end
end
