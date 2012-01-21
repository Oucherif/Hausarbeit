# == Schema Information
#
# Table name: demands
#
#  id          :integer         not null, primary key
#  product_id  :integer
#  timestep_id :integer
#  demandvalue :float
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Demand do
  pending "add some examples to (or delete) #{__FILE__}"
end
