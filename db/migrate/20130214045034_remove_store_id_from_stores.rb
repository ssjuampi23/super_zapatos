class RemoveStoreIdFromStores < ActiveRecord::Migration
  def up
    remove_column :stores, :store_id
  end

  def down
    add_column :stores, :store_id, :integer
  end
end
