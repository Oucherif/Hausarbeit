class CreateSolsegs < ActiveRecord::Migration
  def self.up
    create_table :solsegs do |t|
      t.integer :problem_id
      t.integer :segment_id
      t.integer :timestep_id
      t.float :addcapusagevalue

      t.timestamps
    end
  end

  def self.down
    drop_table :solsegs
  end
end
