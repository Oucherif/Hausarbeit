class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.integer :problem_id
      t.integer :product_id
      t.integer :timestep_id
      t.float :demandvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
