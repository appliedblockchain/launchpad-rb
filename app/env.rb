require 'digest/sha2'
require 'bundler'
Bundler.require :default, :production

DOCKER = ENV["DOCKER"] == "1"

# ETH

eth_host = "localhost"
eth_host = "parity" if DOCKER
ETH_HOST = eth_host

ETH = Ethereum::HttpClient.new "http://#{ETH_HOST}:8545"

CONTRACT = Ethereum::Contract.create file: "store.sol", client: ETH
address = CONTRACT.deploy_and_wait
puts "new contract: #{address}"

# DB

DB_HOST = DOCKER ? "postgres" : "localhost"

DataMapper.setup :default, "postgres://postgres:foobar@#{DB_HOST}"

require_relative 'models/post'

DataMapper.finalize

DataMapper.auto_migrate!

require_relative 'routes/root'
require_relative 'routes/resource'
