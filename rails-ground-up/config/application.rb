require File.expand_path('../boot', __FILE__)

require "rails/all"

Bundler.require :default, Rails.env

module RailsGroundUp
	class Application < Rails::Application
		config.encoding = "utf-8"
		config.assets.enabled = true
	end
end