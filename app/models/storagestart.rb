# == Schema Information
#
# Table name: storagestarts
#
#  id                :integer         not null, primary key
#  problem_id        :integer
#  product_id        :integer
#  storagestartvalue :float
#  created_at        :datetime
#  updated_at        :datetime
#

class Storagestart < ActiveRecord::Base
  belongs_to :problem
  belongs_to :product
  validates :product_id,            :presence   => true
  validate :product_id_exists
    def product_id_exists
     if Product.find_by_id(product_id)==nil
       errors.add(:base, "Produkt muss definiert sein")
     end
    end
  validates :storagestartvalue,     :presence   => true
  validates_numericality_of :storagestartvalue
  attr_accessible :product_id, :storagestartvalue
end
