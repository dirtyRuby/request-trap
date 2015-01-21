class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :trap_id

      t.timestamps
    end
  end
end
