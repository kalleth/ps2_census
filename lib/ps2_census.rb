require 'httparty'
require_relative 'ps2_census/base'
require_relative 'ps2_census/character'
require_relative 'ps2_census/outfit'

module Ps2Census
  class << self

    attr_accessor :game, :service_id
    API_URL = "http://census.soe.com/get"

    def configure
      yield self
    end

    def base_uri
      "#{API_URL}/#{game}"
    end
  end
end
