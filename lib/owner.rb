require 'fish.rb'
require 'cat.rb'
require 'dog.rb'


class Owner
	attr_accessor :name, :pets

  @@all = []

  def initialize(name)
  	@name = name
  	@@all << self
  	@pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def name
  	@name
  end

  def save
  	self.class.all << self
  end

  def self.all
  	@@all
  end

  def self.count
  	@@all.length
  end

  def self.reset_all
  	self.all.clear
  end

  def species
  	self.name
  end

  def say_species
  	return "I am a #{self.species}."
  end

  def pets
  	@pets 
  end

  def buy_fish(name)
  	new_fish = Fish.new(name)
  	self.pets[:fishes] << new_fish
  	self.pets[:fishes]
  end

  def buy_cat(name)
  	new_cat = Cat.new(name)
  	self.pets[:cats] << new_cat
  	self.pets[:cats]
  end

  def buy_dog(name)
  	new_dog = Dog.new(name)
  	self.pets[:dogs] << new_dog
  	self.pets[:dogs]
  end

  def walk_dogs
  	self.pets[:dogs].map! {|dog| dog.mood = "happy"}
  end

  def play_with_cats
  	self.pets[:cats].map! {|cat| cat.mood = "happy"}
  end

  def feed_fish
  	self.pets[:fishes].map! {|fish| fish.mood = "happy"}
  end

  def sell_pets
  	self.pets[:fishes].map! {|fish| fish.mood = "nervous"}
  	self.pets[:dogs].map! {|fish| fish.mood = "nervous"}
  	self.pets[:cats].map! {|fish| fish.mood = "nervous"}
  	self.pets.clear
  end

  def list_pets
  	return "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end