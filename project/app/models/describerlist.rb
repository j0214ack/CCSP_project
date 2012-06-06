class Describerlist < ActiveRecord::Base
  attr_accessible :courseid, :userid
  belongs_to :userlist
  belongs_to :courselist
end
