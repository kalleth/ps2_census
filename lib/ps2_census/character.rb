require_relative 'character_list/times'
require_relative 'character_list/certs'

module Ps2Census
  class Character < Base
    attr_accessor :id

    # Parameters not worth creating sub-models for
    attr_accessor :name, :faction, :rank, :score, :creation_date, :active_class
    # complex objects
    attr_accessor :certs
    attr_accessor :times
    # conditional attributes
    attr_accessor :rank, :member_since

    class << self
      def hide_options
        "stats_one_life,stats,stats_daily,stats_weekly,stats_monthly,loadouts,item_list,skill_list,loadouts"
      end

      def by_id(character_id)
        base_uri "#{Ps2Census.base_uri}"
        response = get("/character/#{character_id}?c:hide=#{hide_options}")
        validate_response(response)
        # only obtaining a single character, so .first is correct (if we were searching, it wouldn't)
        if response.has_key?('character_list') && response['character_list'].any?
          new(response['character_list'].first)
        else
          false
        end
      end

      def validate_response(data)
        true
      end
    end

    def initialize(data)
      self.id = data['id']
      self.name = data['name']['first']
      self.faction = data['type']['faction']
      # Again, we're only initialising a single character record.
      self.rank = data['experience'].first['rank']
      self.score = data['experience'].first['score']
      self.creation_date = data['type']['creation_date']
      self.active_class = data['profile']['active_name']['en']
      self.certs = Ps2Census::CharacterList::Certs.new(data['certs'])
      self.times = Ps2Census::CharacterList::Times.new(data['times'])
      if data.has_key?('rank')
        # Loaded via outfit
        self.rank = data['rank']
        self.member_since = from_time(data['member_since'])
      end
    rescue NoMethodError
      raise ApiLoadError
    end
  end
end
