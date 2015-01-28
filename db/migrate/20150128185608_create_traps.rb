class CreateTraps < ActiveRecord::Migration
  def up
    create_table :traps do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :traps
  end
end
