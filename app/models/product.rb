# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  problem_id  :integer
#  productname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  belongs_to :problem
  has_many :preperiods, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :capusages, :dependent => :destroy
  has_many :storagecosts, :dependent => :destroy
  has_many :storagestarts, :dependent => :destroy
  validates :productname,     :presence   => true
  validates_uniqueness_of :productname, :scope => :problem_id
  attr_accessible :productname

end
