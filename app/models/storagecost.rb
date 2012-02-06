# == Schema Information
#
# Table name: storagecosts
#
#  id               :integer         not null, primary key
#  problem_id       :integer
#  product_id       :integer
#  storagecostvalue :float
#  created_at       :datetime
#  updated_at       :datetime
#

class Storagecost < ActiveRecord::Base

  belongs_to :product
  validates :product_id,     :presence   => true
  validate :product_id_exists
    def product_id_exists
     if Product.find_by_id(product_id)==nil
       errors.add(:base, "Produkt muss definiert sein")
     end
    end
  validates :storagecostvalue,     :presence   => true
  validates_numericality_of :storagecostvalue
  attr_accessible :product_id, :storagecostvalue

end
