class RemovePledges < ActiveRecord::Migration
  def up
  	drop_table :pledges

    create_table :pledges do |t|
      t.references :user_id
      t.references :event_id
      t.string :name
      t.decimal :amount

      t.timestamps
  	end

    add_index :pledges, :user_id_id
    add_index :pledges, :event_id_id
  end

  def down
  end
end
