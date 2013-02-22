module Ps2Census
  module CharacterList
    class Times
      attr_accessor :last_save, :last_login, :minutes_played

      def initialize(data)
        self.last_save = data['last_save']
        self.last_login = data['last_login']
        self.minutes_played = data['minutes_played']
      end
    end
  end
end
