require_relative 'venture_capitalist'
require_relative 'funding_round'
class Startup
    attr_reader :name, :founder, :domain

    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        @@all.find {|startup| startup.founder == name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
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
