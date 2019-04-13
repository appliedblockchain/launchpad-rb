require 'digest/sha2'
require 'bundler'
Bundler.require :default, :production

ETH = Ethereum::HttpClient.new 'http://localhost:8545'

DataMapper.setup :default, "postgres://postgres:foobar@postgres"

DataMapper.auto_migrate!

require_relative 'models/post'

DataMapper.finalize

require_relative 'routes/root'
require_relative 'routes/resource'
