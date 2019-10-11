class Startup
    
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        self.all.find do |s|
            s.founder == name
        end
    end

    def self.domains
        self.all.collect do |s|
            s.domain
        end
    end

    def sign_contract(venture_capitalist, type, amount)
        fund = FundingRound.new(self, venture_capitalist)
        fund.type = type
        fund.investment = amount
    end

    def num_funding_rounds
        FundingRound.all.select {|f| f.startup == self}.length
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