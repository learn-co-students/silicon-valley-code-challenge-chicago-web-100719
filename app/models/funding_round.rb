class FundingRound
    
    attr_accessor :type
    attr_reader :startup, :venture_capitalist, :investment
    
    @@all = []

    def initialize(startup, venture_capitalist)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @@all << self
    end

    def investment=(float)
        if float.class == Float && float.positive?
            @investment = float
        end
    end

    def self.all
        @@all
    end








end
