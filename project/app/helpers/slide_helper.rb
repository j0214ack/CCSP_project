module SlideHelper

def raw_post(action, params, body)
    @request.env['RAW_POST_DATA'] = body
    response = post(action, params)
    name = "123.txt"
    directory = "#{Rails.root}/public/data"
	#create the file path
	path = File.join(directory,name)
        #write the file
	File.open(path, "wb+") {|f| f.write(body.read) 
        f.close()}
     @request.env.delete('RAW_POST_DATA')
end
	
end
