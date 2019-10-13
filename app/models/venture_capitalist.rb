class VentureCapitalist
  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select {|capitalist| capitalist if capitalist.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self }
  end

  def portfolio
    startups = self.funding_rounds.map { |fr| fr.startup }
    return startups.uniq
  end

  def biggest_investment
    investments = self.funding_rounds.map { |fr| fr.investment }
    biggest = investments.max
    return self.funding_rounds.select { |fr| fr.investment == biggest }
  end

  def invested(domain)
    domain_funding_rounds = self.funding_rounds.select { |fr| fr.startup.domain == domain }
    domain_investments = domain_funding_rounds.sum { |fr| fr.investment }
  end

end
