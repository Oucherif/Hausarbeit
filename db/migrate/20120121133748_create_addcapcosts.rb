class CreateAddcapcosts < ActiveRecord::Migration
  def self.up
    create_table :addcapcosts do |t|
      t.integer :problem_id
      t.integer :timestep_id
      t.float :addcapcostvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :addcapcosts
  end
end
