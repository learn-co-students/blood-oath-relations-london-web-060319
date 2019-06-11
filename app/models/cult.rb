class Cult

    attr_accessor :name, :location, :date_founded, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, date_founded, slogan)
        @name = name
        @location = location
        @date_founded = date_founded
        @slogan = slogan
        @minimum_age = 21
        @@all << self
    end

    def self.all
    # returns an Array of all the cults
        @@all
    end

    def recruit_follower(follower)
        # takes in an argument of a Follower instance and adds them to this cult's list of followers
        follower.age > @minimum_age ? BloodOath.new(self, follower) : "You are too young to join"
    end

    def cult_population
    # returns a Fixnum that is the number of followers in this cult
        followers.uniq.length
    end

    def self.find_by_name(name)
     # takes a String argument that is a name and returns a Cult instance whose name matches that argument
        @@all.select {|c| c.name == name}
    end

    def self.find_by_location(location)
    # takes a String argument that is a location and returns an Array of cults that are in that location
        @@all.select {|c| c.location == location}
    end

    def self.find_by_founding_year(num)
    # takes a Fixnum argument that is a year and returns all of the cults founded in that year
        @@all.select {|c| c.date_founded == num}
    end

    def blood_oaths
        BloodOath.all.select{|b| b.cult == self}
    end

    def followers
        blood_oaths.collect(&:follower)
    end

    def average_age
        # returns a Float that is the average age of this cult's followers
        (followers.sum(&:age) / c1.followers.length).to_f
    end

    def my_followers_mottos
        # prints out all of the mottos for this cult's followers
        followers.collect(&:life_motto)
    end

    def self.least_popular
        # returns the Cult instance who has the least number of followers :(
        @@all.min_by {|c| c.followers.length }
    end

    def self.location_count
        # code goes here
        location_hash = {}
        @@all.each do |c|
            !location_hash[c.location].nil? ? location_hash[c.location]+=1 : location_hash[c.location]=1
        end
        location_hash
    end

    def self.most_common_location
        location_count.max_by{ |location, count| count }[0]
    end
end