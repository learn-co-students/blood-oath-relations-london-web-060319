class Follower

    attr_accessor :name, :age, :life_motto
                  
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
    # returns an Array of all the followers
        @@all
    end

    def blood_oaths
        BloodOath.all.select{|b| b.follower == self}
    end

    def cults
    # returns an Array of this follower's cults
        blood_oaths.collect(&:cult)
    end

    def join_cult(cult)
    # takes in an argument of a Cult instance and adds this follower to the cult's list of followers
        @age > cult.minimum_age ? BloodOath.new(cult, self) : "You are too young to join"  
    end

    def self.of_a_certain_age(num)
    #  takes a Fixnum argument that is an age and returns an Array of followers who are the given age or older
        @@all.select {|f| f.age >= num}
    end

    def my_cults_slogans
        cults.collect(&:slogan)
    end

    def fellow_blood_oathers
        BloodOath.all.select{|b| self.cults.include?(b.cult) && self != b.follower}
    end

    def fellow_cult_members
        fellow_blood_oathers.collect(&:follower)
    end

    def self.follower_activity
        follower_hash = {}
        @@all.collect{|f| follower_hash[f] = f.cults.length}
        follower_hash
     end

    def self.most_active_follower
        follower_activity.max_by{|f,c| c }[0]
    end

    def self.sort_by_activity
        follower_activity.sort_by{|key, value| value}.reverse
    end

    def self.top_ten_followers
        sort_by_activity[0..9]
    end
end