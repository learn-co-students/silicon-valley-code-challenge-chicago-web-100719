class VentureCapitalist
attr_reader :name
attr_accessor :worth
@@all = []

    def initialize(name)
        @name = name
        @worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {
            |capitalist| capitalist.worth > 1000000000
        }
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {
            |round| round.venture_capitalist.name == self.name
        }
    end

    def portfolio
        investments = funding_rounds.collect {
            |round| round.startup.name
        }
        investments.uniq
    end

    def biggest_investment
        big_round = funding_rounds[0]
        funding_rounds.each {
            |round|  if round.amount > big_round.amount
            big_round = round
        end
        }
        return big_round
    end

    def invested(domain)
        domains = funding_rounds.select {
            |round| round.startup.domain == domain
        }

        domains.sum {
            |round| round.amount
        }

    end

end
