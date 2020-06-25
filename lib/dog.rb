class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save  
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
end