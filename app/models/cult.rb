class Cult
  attr_reader :name, :location, :founding_year, :slogan, :minimum_age
  @@all = []

  def initialize(name, location, founding_year, slogan, minimum_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower, initiation_date)
    if follower.age >= minimum_age
    BloodOath.new(follower, self, initiation_date)
    else
      puts "These are not the droids you are looking for"
    end
  end

  def oaths
    BloodOath.all.select {|oath| oath.cult == self}
  end

  def followers
    oaths.map {|oath| oath.follower}
  end

  def cult_population
    followers.count
  end

  def self.find_by_name(nom)
    @@all.find {|cult| cult.name == nom}
  end

  def self.find_by_location(loc)
    @@all.find {|cult| cult.location == loc}
  end

  def self.find_by_founding_year(year)
    @@all.find {|cult| cult.founding_year == year}
  end

  def average_age
    followers.sum {|follower| follower.age} / followers.count.to_f
  end

  def my_oaths_mottos
    followers.map {|follower| follower.life_motto}
  end

  def self.least_popular
    @@all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    com_loc = @@all.map {|cult| cult.location}
    com_loc.max_by {|i| com_loc.count(i)}
  end

end
