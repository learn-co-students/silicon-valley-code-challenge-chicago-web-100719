class VentureCapitalist
attr_reader :name, :total_worth
@@all =[]


def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
end

def self.all
    @@all
end

def self.tres_commas_club
    self.all.select {|vc| vc.total_worth > 1000000000}
end 

def self.offer_contract (startup, type, investment)
    FundingRound.new(startup, self, type, investment)
end

def self.funding_rounds
    FundingRound.all.collect {|x| x.venture_capitalist == self}
end

def self.portfolio
    self.funding_rounds.map {|x| x.startup}.uniq
end

def self.biggest_investment
    self.funding_rounds.map {|x| x.investment}.max
end

def self.invested(domain)
    self.funding_rounds.select {|x| x.startup.domain == domain}.sum
end

end
