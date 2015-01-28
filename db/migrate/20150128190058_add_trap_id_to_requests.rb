class AddTrapIdToRequests < ActiveRecord::Migration
  def up
    add_reference :requests, :trap, index: true
  end

  def down
    remove_reference :requests, :trap, index: true
  end
end
