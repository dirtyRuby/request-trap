class ChangeRequestsHeadersDatatype < ActiveRecord::Migration
  def up
    change_column :requests, :headers, :text
  end

  def down
    change_column :requests, :headers, :string
  end
end
