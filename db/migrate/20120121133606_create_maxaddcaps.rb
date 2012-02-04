class CreateMaxaddcaps < ActiveRecord::Migration
  def self.up
    create_table :maxaddcaps do |t|
      t.integer :problem_id
      t.integer :segment_id
      t.integer :timestep_id
      t.float :maxaddcapvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :maxaddcaps
  end
end
