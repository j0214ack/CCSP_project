class Userlist < ActiveRecord::Base
  attr_accessible :password, :username
  validates :username, :uniqueness=>true, :presence=>true
  validates :password, :presence=>true
  has_many :describerlists
  has_many :courselists, :through=>:describelists, :uniq=>true
   def self.authenticate(user_info)
      find_by_username_and_password(user_info[:username],user_info[:password])
   end
end
