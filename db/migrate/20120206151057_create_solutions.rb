class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.integer :problem_id
      t.integer :product_id
      t.integer :timestep_id
      t.float :productionvalue
      t.float :storageamountvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
