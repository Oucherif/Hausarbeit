# == Schema Information
#
# Table name: solprodstors
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

require 'spec_helper'

describe Solprodstor do
  pending "add some examples to (or delete) #{__FILE__}"
end
