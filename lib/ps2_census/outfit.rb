module Ps2Census
  class Outfit < Base
    attr_accessor :id
    attr_accessor :alias, :name, :time_created, :leader_character_id

    attr_accessor :members

    class << self
      def by_id(outfit_id, opts={})
        base_uri "#{Ps2Census.base_uri}"
        response = if opts[:load_members]
                     get("/outfit/#{outfit_id}?c:resolve=member_character")
                   else
                     get("/outfit/#{outfit_id}")
                   end
        puts "Recieved response in #{response['milliseconds']} ms"
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
      # The PS2 API sometimes returns times as scientific notation
      self.time_created = from_time(data['time_created'])
      self.leader_character_id = data['leader_character_id']
      if data.has_key?('members')
        self.members = data['members'].map do |m|
          begin
            Ps2Census::Character.new(m)
          rescue ApiLoadError
            nil
          end
        end.compact
      end
    end

    def leader
      @leader ||= Ps2Census::Character.by_id(leader_character_id)
    end

  end
end
