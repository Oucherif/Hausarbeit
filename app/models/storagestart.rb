# == Schema Information
#
# Table name: storagestarts
#
#  id                :integer         not null, primary key
#  product_id        :integer
#  storagestartvalue :float
#  created_at        :datetime
#  updated_at        :datetime
#

class Storagestart < ActiveRecord::Base
end
