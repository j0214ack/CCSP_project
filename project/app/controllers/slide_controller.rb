class SlideController < ApplicationController
require 'cgi'
require 'uri'
require 'net/http'
 
  def sendingjson
      raw_post :index, {}, {:foo => "bar", :bool => true}.to_json	
  end
  def sendrequest
    uri = URI.parse("https://localhost:3000/crossdomain.xml")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.ca_file =  "#{Rails.root}/project.csr"
    http.start do
      puts http.get("#{host}#{path}")
    end
    	  
  end


end
