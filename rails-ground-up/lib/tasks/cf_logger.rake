ENV["RAILS_ENV"] ||= "development"
DB_CONFIG_PATH = Rails.root.join("config")

desc "Prints the database configuration according to the environment"

namespace :db do
	task :conf do
		require 'psych'
		file = Dir[File.join(DB_CONFIG_PATH, "database.{yaml,yml}")].first
		raise "Could not find a database.yaml file in path : #{DB_CONFIG_PATH}" unless file
		database_conf = Psych.load_file(file)
		puts database_conf[ENV["RAILS_ENV"]]
	end
end