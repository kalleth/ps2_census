module Ps2Census
  class Base
    include HTTParty
    # debug_output $stdout
    
    def from_time(dodgy_time)
      Time.at(("%f" % dodgy_time).to_i).to_datetime
    end
  end
end
