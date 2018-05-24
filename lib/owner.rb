
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@owner = []
  
  def initialize(species)
    self.pets = { fishes: [], cats: [], dogs: [] }
    self.species = species
    self.class.all << self
  end
  
  def self.all
    @@owner
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def self.count
    self.all.size
  end
  
  def species=(species)
    if @species == nil
      @species = species
    else
      raise NoMethodError, "Species is already set as #{self.species}"
    end
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end
  
  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end
  
  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy" }
  end
  
  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy" }
  end
  
  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = "happy" }
  end
  
  def sell_pets
    self.pets.each do |species, pets|
      pets.each { |pet| pet.mood = "nervous"}
    end
    self.pets.clear
  end
  
  def list_pets
    "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
  end
end
