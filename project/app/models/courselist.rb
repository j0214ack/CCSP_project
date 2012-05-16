class Courselist < ActiveRecord::Base
  attr_accessible :author, :coursename, :description, :image, :ispublic, :ranking
  validates :author, :presence=>true
  validates :coursename, :presence=>true
  has_many :describerlists
  has_many :userlists, :through=> :describerlists
  has_many :coursecontents
end
