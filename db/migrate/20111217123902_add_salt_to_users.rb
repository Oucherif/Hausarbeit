# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class AddSaltToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :salt, :string
  end

  def self.down
    remove_column :users, :salt
  end
end
