require 'sinatra'

require_relative 'routes'

set :bind, '0.0.0.0'

file = File.new('log/mc30.log', 'a+')
file.sync = true
use Rack::CommonLogger, file
