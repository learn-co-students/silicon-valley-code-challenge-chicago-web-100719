require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

twitter = Startup.new("Twitter", "Jim", "twitter.com")

facebook = Startup.new("Facebook", "Mark Zuckerburg", "facebook.com")
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

stacy = VentureCapitalist.new("Stacy", 200)
bob = VentureCapitalist.new("Bob", 100)
rich = VentureCapitalist.new("Rich", 3000000000000000000)
dick = VentureCapitalist.new("Dick", 900000000000000000)


# money_time = FundingRound.new(twitter, stacy)
more_money = FundingRound.new(facebook, dick)

twitter.sign_contract(rich, "Angel", 450.00)
twitter.sign_contract(rich, "Angel", 200.80)

bob.offer_contract(twitter, "Angel", 1000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line