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

end
