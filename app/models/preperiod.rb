# == Schema Information
#
# Table name: preperiods
#
#  id              :integer         not null, primary key
#  product_id      :integer
#  preperiodnumber :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Preperiod < ActiveRecord::Base

  belongs_to :product
  has_many :capusages, :dependent => :destroy

end
