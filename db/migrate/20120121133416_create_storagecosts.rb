class CreateStoragecosts < ActiveRecord::Migration
  def self.up
    create_table :storagecosts do |t|
      t.integer :problem_id
      t.integer :product_id
      t.float :storagecostvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :storagecosts
  end
end
