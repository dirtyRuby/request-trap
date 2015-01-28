class RemoveRequestDateFromRequests < ActiveRecord::Migration
  def up
    remove_column :requests, :request_date
  end

  def down
    add_column :requests, :request_date, :datetime
  end
end
