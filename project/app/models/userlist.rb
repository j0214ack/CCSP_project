class Userlist < ActiveRecord::Base
  attr_accessible :password, :username
  validates :username, :uniqueness=>true, :presence=>true
  validates :password, :presence=>true
  has_many :describerlists
  has_many :courselists, :through=>:describerlists, :uniq=>true
end
