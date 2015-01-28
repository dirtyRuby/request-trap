class RemoveDomNameFromRequests < ActiveRecord::Migration
  def up
    remove_column :requests, :dom_name
  end

  def down
    add_column :requests, :dom_name, :string
  end
end
