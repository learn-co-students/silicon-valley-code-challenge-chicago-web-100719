require 'pry'
class Startup
attr_reader :name, :founder, :domain
@@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find {
            |startup| startup.founder == founder
        }
    end

    def self.domains
        self.all.map {
            |startup| startup.domain
        }
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def all_funds
        FundingRound.all.select {
            |round| round.startup.name == self.name
        }
    end
    
    def num_funding_rounds
        all_funds.count
    end

    def total_funds
        all_funds.sum {
            |round| round.amount
        }
    end

    def investors
        investment = all_funds.collect {
            |round| round.venture_capitalist
        }
        investment.uniq
    end

    def big_investors
       VentureCapitalist.tres_commas_club.select {
           |capitalist| self.investors.include?(capitalist)
       }
    end

end

