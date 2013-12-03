class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user
      t.references :event
      t.string :name
      t.decimal :amount

      t.timestamps
    end
    add_index :pledges, :user_id
    add_index :pledges, :event_id
  end
end
