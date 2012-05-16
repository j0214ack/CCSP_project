class Describerlist < ActiveRecord::Base
  attr_accessible :courseid, :userid
  belongs_to :userlist
  belings_to :courselist
end
