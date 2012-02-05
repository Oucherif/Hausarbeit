# == Schema Information
#
# Table name: storagecosts
#
#  id               :integer         not null, primary key
#  product_id       :integer
#  storagecostvalue :float
#  created_at       :datetime
#  updated_at       :datetime
#

class Storagecost < ActiveRecord::Base

  belongs_to :product
  validates :product_id,     :presence   => true
  validates :storagecostvalue,     :presence   => true
  validates_numericality_of :storagecostvalue
  attr_accessible :product_id, :storagecostvalue

end
