module Ps2Census
  module CharacterList
    class Certs
      attr_accessor :percentagetonext, :currentpoints

      def initialize(data)
        self.percentagetonext = data['percentagetonext']
        self.currentpoints = data['currentpoints']
      end
    end
  end
end
