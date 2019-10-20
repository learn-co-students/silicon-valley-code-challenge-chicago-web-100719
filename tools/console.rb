require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

google = Startup.new("Google", "Nik", "search")
airbnb = Startup.new("airbnb", "Dan", "rent")



pat = VentureCapitalist.new("Pat", 1000000000)
val = VentureCapitalist.new("Val", 10000000)


googlepat = FundingRound.new(google, pat, "seriesA", 1000000)
googleval = FundingRound.new(google, val, "serieaB", 10000)

airbnbpat = FundingRound.new(airbnb, pat, "seriesC", 1000000000)
airbnbval = FundingRound.new(airbnb, val, "seriesD", 100000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line