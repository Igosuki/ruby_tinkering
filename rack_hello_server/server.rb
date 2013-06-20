require 'rubygems'
require 'rack'

class HelloServer

	PUBLIC_DIR = File.expand_path("./public")

	def call(env) 
		resolved_path = File.expand_path(PUBLIC_DIR + URI.unescape(env["REQUEST_PATH"]))
		unless allowed(resolved_path)
			return [403, {"Content-Type" => "text/plain"}, ["Forbidden Access"]]
		end
		if file = real_file(resolved_path)
			[200, {"Content-Type" => content_type(file), "Content-Length" => file.size.to_s}, [file.read]]
		else
			[404, {"Content-Type" => "text/plain"}, ["Not Found"]]
		end
	end

	def real_file(path) 
		if File.exists?(real_path = File.directory?(path) ? File.join(path, "index.html") : path)
			File.new(real_path)
		end
	end

	def allowed(path)
		File.fnmatch(PUBLIC_DIR+"*", path, File::FNM_CASEFOLD)
	end

	def content_type(file) 
		case File.extname(file)
			when /\.(gif|png|jpeg|jpg)/ then "image/#{$1}"
			when /\.(htm|html)/ then "text/html"
			else "text/plain"
		end
	end
end



