class AddTrapIdToRequest < ActiveRecord::Migration
  def up
    add_column :requests, :dom_name, :string
  end

  def down
    remove_column :requests, :dom_name
  end
end
