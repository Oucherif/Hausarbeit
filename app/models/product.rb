# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  productname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base

  has_many :preperiods, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :capusages, :dependent => :destroy
  has_many :storagecosts, :dependent => :destroy

end
