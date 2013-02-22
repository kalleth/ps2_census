require 'pry'
require_relative 'lib/ps2_census'
Ps2Census.configure do |config|
  config.endpoint = "ps2-beta"
end
obj = Ps2Census::Character.by_id('5428010917248465169')
puts obj.inspect
