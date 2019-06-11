class Follower
  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def oaths
    BloodOath.all.select {|oath| oath.follower == self}
  end

  def cults
    oaths.map {|oath| oath.cult}
  end

  def oath_count
    oaths.count
  end

  def join_cult(cult, initiation_date)
    if age >= cult.minimum_age
      BloodOath.new(self, cult, initiation_date)
    else
      puts "These are not the droids you are looking for"
    end
  end
    
  def self.of_a_certain_age(num)
    @@all.select {|follower| follower.age > num}
  end

  def my_cult_slogans
    cults.map {|cult| cult.slogan}
  end

  def self.activity
    active = @@all.select {|follower| follower.oaths}
    active.sort_by {|i| active.count(i)}
  end

  def self.most_active
    activity.first
  end

  def self.top_ten
    activity.first(10)
  end

  def fellow_cult_members
    @@all.select {|follower| follower.cults & self.cults != [] && follower != self}
  end

end
