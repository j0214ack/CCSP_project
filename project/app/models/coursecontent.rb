class Coursecontent < ActiveRecord::Base
  attr_accessible :canvassource, :courseid, :recordsource, :slideorder, :slidesource
  validates :courseid, :presence => true
  validates :slideorder, :presence => true
  validates :slidesource, :presence => true
  belongs_to :courselist
  def self.save(upload)
	name = upload['coursecontent'].original_filename
        directory = "#{Rails.root}/public/data"
	#create the file path
	path = File.join(directory,name)
        #write the file
	File.open(path, "w+") {|f| f.write(upload['coursecontent'].read)}	
  end
  def self.cleanup
    File.delete("#{Rails.root}/public/data/#{@filename}") 
    #File.exist?("#{RAILS_ROOT}/public/data/#{@filename}")
  end
  
end 
