# == Schema Information
#
# Table name: solutions
#
#  id                 :integer         not null, primary key
#  problem_id         :integer
#  product_id         :integer
#  timestep_id        :integer
#  productionvalue    :float
#  storageamountvalue :float
#  created_at         :datetime
#  updated_at         :datetime
#

class Solution < ActiveRecord::Base
end
