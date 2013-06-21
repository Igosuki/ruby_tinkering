desc "Prints the database configuration according to the environment"
DB_CONFIG_PATH = "../../../config/database"
task :cf_log do
	require 'psych'

	file_name = File.expand_path(DB_CONFIG_PATH+".yaml", __FILE__)
	file_name = File.expand_path(DB_CONFIG_PATH+".yml", __FILE__) if !File.exists?(file_name)	
	raise "Could not find a database.yaml file in path : #{file_name}" unless File.exists?(file_name) 
	
	database_conf = Psych.load_file(file_name)
	puts database_conf[ENV["RAILS_ENV"]]
end
