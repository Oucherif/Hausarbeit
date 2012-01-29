class CreateStoragestarts < ActiveRecord::Migration
  def self.up
    create_table :storagestarts do |t|
      t.integer :product_id
      t.float :storagestartvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :storagestarts
  end
end
