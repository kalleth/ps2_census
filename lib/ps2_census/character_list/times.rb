module Ps2Census
  module CharacterList
    class Times < Ps2Census::Base
      attr_accessor :last_save, :last_login, :minutes_played

      def initialize(data)
        self.last_save = from_time(data['last_save'])
        self.last_login = from_time(data['last_login'])
        self.minutes_played = data['minutes_played']
      end
    end
  end
end
