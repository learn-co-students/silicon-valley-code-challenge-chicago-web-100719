class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []
    def initialize(name, total_worth)
        @total_worth = total_worth
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, amount)
        contract = FundingRound.new(startup, self)
        contract.investment = amount
        contract.type = type
    end

    def funding_rounds
        FundingRound.all.select {|f| f.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.collect {|f| f.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max {|f, g| f.investment <=> g.investment}
    end

    def invested(domain)
        funds = self.funding_rounds.select {|f| f.startup.domain == domain}
        fund_money = funds.sum {|f| f.investment}
    end
end
© 2019 GitHub, Inc.