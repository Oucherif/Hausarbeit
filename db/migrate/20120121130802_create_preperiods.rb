class CreatePreperiods < ActiveRecord::Migration
  def self.up
    create_table :preperiods do |t|
      t.integer :problem_id
      t.integer :product_id
      t.integer :preperiodnumber

      t.timestamps
    end
  end

  def self.down
    drop_table :preperiods
  end
end
