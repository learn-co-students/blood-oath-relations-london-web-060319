require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("creepy crew", "San Bernardino", 1990, "Creep is an ok movie")
c2 = Cult.new("googly eyes", "Wichita", 1995, "The Sistine Chapel would be better if the people had googly eyes")
c3 = Cult.new("googly eyes 2", "Wichita", 1998, "The Sistine Chapel would be better if the people had googly eyes 2")

f1 = Follower.new("Perkins", 23, "I'm lowkey crazy")
f2 = Follower.new("Jess", 72, "looking for companionship in my later years")
f3 = Follower.new("Bilbo", 22, "Adventure")




f1.join_cult(c1)
f2.join_cult(c1)
c1.recruit_follower(f3)
f1.join_cult(c2)


Follower.of_a_certain_age(30)


Cult.find_by_name("googly eyes")
Cult.find_by_location("Wichita")
Cult.find_by_founding_year(1995)

binding.pry


puts "Mwahahaha!" # just in case pry is buggy and exits
