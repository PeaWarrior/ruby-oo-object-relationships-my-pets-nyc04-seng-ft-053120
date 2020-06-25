require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    self.class.all << self
  end

  
  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def say_species
    "I am a #{@species}."
  end

  def cats
    get_pets(Cat)
  end

  def dogs
    get_pets(Dog)
  end

  def buy_cat(pet_name)
    Cat.new(pet_name, self)
  end

  def buy_dog(pet_name)
    Dog.new(pet_name, self)
  end  

  def walk_dogs
    change_mood(Dog.all, "happy")
  end

  def feed_cats
    change_mood(Cat.all, "happy")
  end

  def sell_pets
    change_mood(cats, "nervous")
    change_mood(dogs, "nervous")
    remove_owner(cats)
    remove_owner(dogs)
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  # helper
  def get_pets(pets)
    pets.all.select do |pet|
      pet.owner == self
    end
  end

  def change_mood(pets, new_mood)
    pets.map do |pet|
      pet.mood = new_mood
    end
  end

  def remove_owner(pets)
    pets.map do |pet|
      pet.owner = nil
    end
  end
  

end