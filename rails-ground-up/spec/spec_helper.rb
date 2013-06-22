require 'rubygems'
require 'spork'


Spork.prefork do
	ENV["RAILS_ENV"] ||= 'test'

	require "rails/application"
	require File.join(File.expand_path("../../config", __FILE__), "environment")
	require 'rspec/rails'

	RSpec.configure do |config|
		config.mock_with :rspec
		config.expect_with :rspec
		config.after(:all) do
		p "All tests finished."
		end
	end
end

Spork.each_run do
	Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end
