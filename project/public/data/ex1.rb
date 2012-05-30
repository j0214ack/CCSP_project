# Author f99548008 Dean Huang
require 'nokogiri'
require 'open-uri'
require 'json'
require 'net/http'
require 'strscan'
# Get a HTML
list = []
idlist = []
sec = 1
doc = Nokogiri::HTML(open('http://www.wretch.cc/album/?func=hot'))
puts "HTTP GET Request http://www.wretch.cc/album/?func=hot"
sleep(sec) #second
doc.css('div.side>div.sideII>ul>li>a').each do |link|	
	hot_http=link['href']
	doc1 = Nokogiri::HTML(open(hot_http))
	puts ["HTTP GET Request ",hot_http].join
        sleep(sec) #second

	doc1.css('div.grid>a').each do |link|
        id_http = link['href']
        id = URI.parse(link['href']).query.split("=")[1].split("&")[0]
        repeat=0
	  for i in 0..(idlist.length-1) do
#               puts list[i]
	       if idlist[i] == id
	         repeat = 1
                 break
	      end		       
	  end
	  if repeat == 0 && (idlist.length)<=9
	    list = list+["id"=>id]	
	    idlist<<id
            albumlist = []
	    page = "page=1"
	    while page != "no next"
	      doc2 = Nokogiri::HTML(open(["http://www.wretch.cc/album/",id,"&",page].join))            
	      puts ["HTTP GET Request ",["http://www.wretch.cc/album/",id,"&",page].join].join
	        sleep(sec) #second 
              doc2.css('b>font.small-c>a').each do |link|            
                title = link.text
    	        url = link['href']
	        url = ["http://www.wretch.cc",url[1..url.length]].join
	        albumlist = albumlist+[{"title"=>title},{"url"=>url}]
	      end
	      no_next=1
	      doc2.xpath('//a[@id="next"]').each do |link|
		if link['href'].split("&")[0] == id
	       	   page = link['href'].split("&")[1]	
	           no_next=0;	   
	        end
		break
	      end
	      if no_next==1
		  page = "no next"
	      end
	    end
	     list=list+["albums"=>albumlist]   	 
	  end
       	   	   
	  end          	  
          break
end

aFile = File.new("albums.json", "w+")
if aFile
   aFile.syswrite(JSON.pretty_generate(list))
else
   puts "Unable to open file!"
end

