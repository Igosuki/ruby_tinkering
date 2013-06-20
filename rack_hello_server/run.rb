require_relative 'server'

Rack::Handler::Mongrel.run HelloServer.new, :Port => 9292