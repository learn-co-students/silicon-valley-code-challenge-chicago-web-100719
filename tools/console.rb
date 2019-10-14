require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
test_startup = Startup.new("Little Duck", "John Smith", "www.littleduck.com")
other_startup = Startup.new("Green Tree", "Jane Jones", "www.greentree.org")
startup_3 = Startup.new("Small Dog", "Sonja Redd", "www.tinydog.com")
coffee_startup = Startup.new("Fine Coffee", "Dale Cooper", "www.double-r.com")

bill = VentureCapitalist.new("Bill Gates")
bill.worth = 110000000.00

oprah = VentureCapitalist.new("Oprah Winfrey")
oprah.worth = 200000000000.00

warren = VentureCapitalist.new("Warren Buffet")
warren.worth = 3000000000.00

gwen = VentureCapitalist.new("Gwen Stacy")
gwen.worth = 500000.00



test_fund = FundingRound.new(test_startup, oprah,"Angel", 1000.00 )
other_fund = FundingRound.new(other_startup, bill, "Series A", 40000.00)
fund_3 = FundingRound.new(test_startup, bill, "Series B", 5500.00)
more_funds = FundingRound.new(test_startup, oprah, "Seed", 3000.00)
fund4 = FundingRound.new(coffee_startup, gwen, "Seed", 7000.00)
fund5 = FundingRound.new(startup_3, warren, "Angel", 1000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line