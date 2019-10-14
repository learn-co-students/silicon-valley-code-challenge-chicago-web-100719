require_relative '../config/environment.rb'



def reload
  load 'config/environment.rb'
end

google = Startup.new("google", "pat", "search")
airbnb = Startup.new("airbnb", "val", "hotel")

bill  = VentureCapitalist.new("bill", 1000000000000)
steve = VentureCapitalist.new("steve", 10000000000)
bob = VentureCapitalist.new("bob", 1000000)


# googlebill = FundingRound.new(google, bill, "Type A", 10000)
# googlesteve = FundingRound.new(google, steve, "Type B", 100000)
# airbnbbob = FundingRound.new(airbnb, bob, "Type C", 1000000)

googlebill = Startup.sign_contract(bill, "Type A", 10000)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line