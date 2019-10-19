require_relative 'startup'
require_relative 'venture_capitalist'

class FundingRound
attr_reader :type, :investment, :startup, :venture_capitalist
@@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = Float(investment).abs
        @@all << self
    end

    def self.all
        @@all
    end

end
