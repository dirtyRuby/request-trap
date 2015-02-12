class ChangeRequestsHeadersDatatype < ActiveRecord::Migration
  def up
    change_column :requests, :headers, :binary
  end

  def down
    change_column :requests, :headers, :string
  end
end
