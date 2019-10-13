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
    @@all.find { |startup| startup.founder == name }
  end

  def self.domains
    @@all.map {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.startup == self }
  end

  def num_funding_rounds
    return self.funding_rounds.length
  end

  def total_sum
    return self.funding_rounds.sum { |fr| fr.investment }
  end

  def investors
    venture_capitalists = self.funding_rounds.map { |fr| fr.venture_capitalist }
    return venture_capitalists.uniq
  end

  def big_investors
    self.funding_rounds.select { |fr| VentureCapitalist.tres_commas_club.include?(fr.venture_capitalist) }
  end

end
