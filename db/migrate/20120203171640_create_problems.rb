class CreateProblems < ActiveRecord::Migration
  def self.up
    create_table :problems do |t|
      t.integer :user_id
      t.string :problemname
      t.timestamps
    end
  end

  def self.down
    drop_table :problems
  end
end
