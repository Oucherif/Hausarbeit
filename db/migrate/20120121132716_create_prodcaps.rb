class CreateProdcaps < ActiveRecord::Migration
  def self.up
    create_table :prodcaps do |t|
      t.integer :segment_id
      t.integer :timestep_id
      t.float :prodcapvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :prodcaps
  end
end
