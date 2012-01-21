class CreateCapusages < ActiveRecord::Migration
  def self.up
    create_table :capusages do |t|
      t.integer :product_id
      t.integer :segment_id
      t.integer :preperiod_id
      t.float :capusagevalue

      t.timestamps
    end
  end

  def self.down
    drop_table :capusages
  end
end
