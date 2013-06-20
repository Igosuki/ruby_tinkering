require 'rubygems'
require 'rack'

class HelloServer
	def call(env) 
		req_path = URI.unescape(env["REQUEST_PATH"])
		puts env["REQUEST_METHOD"] + " request on host for : " + req_path
		basedir = File.expand_path("./public")
		if !File.fnmatch(File.expand_path(basedir+"*"), fileName = File.expand_path((basedir + req_path)), File::FNM_CASEFOLD)
			return [403, {"Content-Type" => "text/plain"}, ["Forbidden Access"]]
		elsif File.exists?(fileName = Dir.exists?(fileName) ? File.join(fileName, "index.html") : fileName)
			file = File.open(fileName)
			extname = File.extname(fileName)
			contentType = case extname
				when ".gif", ".png", ".jpeg" then "image/#{extname[1]}"
				when ".htm", ".html" then "text/html"
				else "text/plain"
			end
			puts contentType
			[200, {"Content-Type" => contentType, "Content-Length" => file.size.to_s}, [file.read]]
		else
			[404, {"Content-Type" => "text/plain"}, ["Not Found"]]
		end
	end
end

Rack::Handler::Mongrel.run HelloServer.new, :Port => 9292

