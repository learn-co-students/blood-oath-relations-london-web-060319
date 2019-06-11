class BloodOath

    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize(cult, follower)
        @follower = follower
        @cult = cult
        @initiation_date = Time.now.strftime("%Y-%d-%m")
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all.min_by(&:initiation_date).follower
    end

end