class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.datetime :request_date
      t.string :remote_ip
      t.string :request_method
      t.string :scheme
      t.string :query_string
      t.string :query_params
      t.string :cookies
      t.string :headers
      t.string :dom_name

      t.timestamps
    end
  end

  def down
    drop_table :requests
  end
end
