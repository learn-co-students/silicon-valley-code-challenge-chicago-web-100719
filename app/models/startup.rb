class Startup

attr_reader :name, :founder, :domain
@@all = []
def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
end

def pivot (name, domain)
    @name = name
    @domain = domain
end

def self.all
    @@all
end

def self.find_by_founder(founder)
    self.all.find {|hash| hash.founder == founder}
end

def self.domains
    self.all.collect {|hash| hash.domain}
end

def self.sign_contract(venture_capitalist, type, amount)
   FundingRound.new(self, venture_capitalist, type, amount)
end

def self.num_funding_rounds
    FundingRound.all.select {|x| x.startup == self}.length
end

def self.total_funds
    FundingRound.all.select {|x| x.startup == self}.sum {|y| y.investment}
end


def self.investors
    FundingRound.all.select {|x| x.startup == self}.collect {|y| y.venture_capitalist}.uniq
end

def self.big_investors
    self.investors.select {|x| VentureCapitalist.tres_commas_club.include?(x)}.uniq
end

end

