class CreateTimesteps < ActiveRecord::Migration
  def self.up
    create_table :timesteps do |t|
      t.integer :stepnumber

      t.timestamps
    end
  end

  def self.down
    drop_table :timesteps
  end
end
