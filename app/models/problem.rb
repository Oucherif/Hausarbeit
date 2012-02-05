# == Schema Information
#
# Table name: problems
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :addcapcosts, :dependent => :destroy
  has_many :capusages, :dependent => :destroy
  has_many :demands, :dependent => :destroy
  has_many :maxaddcaps, :dependent => :destroy
  has_many :preperiods, :dependent => :destroy
  has_many :prodcaps, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :segments, :dependent => :destroy
  has_many :storagecosts, :dependent => :destroy
  has_many :storagestarts, :dependent => :destroy
  has_many :timesteps, :dependent => :destroy

  validates :user_id,     :presence   => true
  attr_accessible :user_id
end
