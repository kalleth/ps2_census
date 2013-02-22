module Ps2Census
  class Outfit < Base
    attr_accessor :id
    attr_accessor :alias, :name, :time_created, :leader_character_id

    class << self
      def by_id(outfit_id)
        base_uri "#{Ps2Census.base_uri}"
        response = get("/outfit/#{outfit_id}")
        if response.has_key?('outfit_list') && response['outfit_list'].any?
          new(response['outfit_list'].first)
        else
          false
        end
      end
    end

    def initialize(data)
      self.id = data['id']
      self.alias = data['alias']
      self.name = data['name']
      self.time_created = data['time_created']
      self.leader_character_id = data['leader_character_id']
    end

    def leader
      @leader ||= Ps2Census::Character.by_id(leader_character_id)
    end
  end
end
