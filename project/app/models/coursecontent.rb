class Coursecontent < ActiveRecord::Base
  attr_accessible :canvassource, :courseid, :recordsource, :slideorder, :slidesource
  validates :courseid, :presence => true
  validates :slideorder, :presence => true
  validates :slidesource, :presence => true
  has_one :courselist
end

