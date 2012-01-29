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
  validates :product_id,     :presence   => true
  validates :preperiodnumber,     :presence   => true
  attr_accessible :product_id, :preperiodnumber

end
