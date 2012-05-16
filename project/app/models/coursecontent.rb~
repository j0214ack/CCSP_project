class Coursecontent < ActiveRecord::Base
  attr_accessible :canvassource, :courseid, :recordsource, :slideorder, :slidesource
  validates :courseid, :presence => true
  validates :slideorder, :presence => true
  validates :slidesource, :presence => true
  belongs_to :courselist
  def self.save(upload)
	name = upload['datafile'].original_filename
        directory = "app/assets/data"
	#create the file path
	path = File.join(directory,name)
        #write the file
	File.open(path,"wb") {|f| f.write(upload['datafile'].read)}	
  end
end

