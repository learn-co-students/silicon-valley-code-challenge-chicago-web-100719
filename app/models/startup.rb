require_relative 'venture_capitalist'
require_relative 'funding_round'

class Startup
    attr_reader :founder, :domain
    attr_accessor :name 
    @@all = []
def initialize(name,founder,domain)
    @name= name
    @founder = founder
    @domain = domain
    @@all << self
    end
    def self.all
        @@all
    end
    def pivot(domain,name)
        @domain = domain
        @name = name
    end 
    def find_by_founder(founder)
        Startup.all.find { |hash| hash.founder == founder}
    end 
    def domains
        @@all.map { |hash| hash.domain}
    end 
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self }
    end

    def investors
        FundingRound.all.select {|f| f.startup == self}.collect {|v| v.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|i| VentureCapitalist.tres_commas_club.include?(i)}.uniq
    end

    def total_funds
        fund = FundingRound.all.select {|f| f.startup == self}
        fund.sum {|f| f.investment}
    end
end