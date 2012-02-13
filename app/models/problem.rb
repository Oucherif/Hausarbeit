# == Schema Information
#
# Table name: problems
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  problemname :string(255)
#  created_at  :datetime
#  updated_at  :datetime
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
    validate :user_id_exists
    def user_id_exists
     if User.find_by_id(user_id)==nil
       errors.add(:base, "User muss definiert sein")
     end
    end

  validates :problemname, :uniqueness => true

  attr_accessible :user_id, :problemname
end
