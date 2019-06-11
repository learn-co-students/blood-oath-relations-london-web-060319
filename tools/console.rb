require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#cult
uber = Cult.new("Uber", "NY", 1969, "Ride together, die together", 18)
twitter = Cult.new("Twitter", "San Fran", 2007, "We'll chew your ear off", 50)
airbnb = Cult.new("AirBnb", "London", 1515, "You can check out anytime you like, but you can never leave", 100)

#follower
bill = Follower.new("Bill", 45, "Life is like a box of chocolates")
warren = Follower.new("Warren", 99, "Yippee Ki Yay Mother Forkers")
jeff = Follower.new("Jeff", 238, "Immortality is overrated")

#bloodoath
uberbill = BloodOath.new(bill, uber, "2009-12-23")
twitterbill = BloodOath.new(bill, twitter, "2009-12-23")
airbnbbill = BloodOath.new(bill, airbnb, "2009-12-23")
twitterwarren = BloodOath.new(warren, twitter, "2018-12-23")
uberwarren = BloodOath.new(warren, uber, "2018-12-23")
# airbnbwarren = BloodOath.new(100, airbnb, warren)
airbnbjeff = BloodOath.new(jeff, airbnb, "1815-12-23")
uberjeff = BloodOath.new(jeff, uber, "1995-12-23")
# twitterjeff = BloodOath.new(300, twitter, jeff)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
