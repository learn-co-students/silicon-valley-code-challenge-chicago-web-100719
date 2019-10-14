class FundingRound
    attr_reader :startup, :venture_capitalist, :type
    attr_accessor :amount
    
    @@all = []
    
    def initialize(startup, venture_capitalist, type, amount = 0.00)
            @startup = startup
            @venture_capitalist = venture_capitalist
            @type = type
            @amount = amount
            @@all << self
        end
    
    def self.all
        @@all
    end
    
    end