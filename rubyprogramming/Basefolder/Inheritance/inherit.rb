# https://launchschool.com/books/oo_ruby/read/inheritance
# If the intialize is present in both parent and child while
# the child is intialised only the child initialise is called and parent initialize is not called
# Also refer to init_initialize_modules_classes.rb

class Animal

  attr_accessor :name
  def initialize(name)
    puts "I am inside parent initailize"
    @name = name
  end

  def speak
    "Hello!"
  end

  def parent_name
    @name
  end
end

class Bird < Animal
  attr_accessor :name

  def initialize(n)
    puts "I am inside Bird initailize"
    self.name = n
  end

  def speak
    puts "#{self.name} says arf!"
    parent_name + " from Parentname class"
  end
end

birds = Bird.new("Sparrow")  # => I am inside Bird initailize, parent is not called
puts "Initialised Bird instance"



# You can forcefully call the parent initialise in the above case by just adding super inside the initialize
# you dont have to pass the parameter too to the super. It will take care of calling the insitlaise in the parent
# class with the parameters passed to the child initialise


class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    puts "I am inside Gooddog initailize"
    self.name = n
    super
  end

  def speak
    puts "#{self.name} says arf!"
    parent_name + " from Parentname class"
  end
end


sparky = GoodDog.new("Doggy")
# => Here first the child intilaise is called and the same parameter is passed to super initialise and assigned
# to the @name parameter
puts "Initialised Dog instance"


# For the instance varaible,
# If both parent and child have same name, then

# there is no seperate variables for parent and child if they both haave the same named variable
# For ex: name here is commonn to both parent and child, when different values are passed to self.name
# and super name, the last assigned values are assigned to self.name as well


class Fish < Animal
  attr_accessor :name

  def initialize(n)
    puts "I am inside Fish initailize"
    self.name = "Mole"
    super("Golden Fish")
  end

  def speak
    puts "#{self.name} says arf!"
    parent_name + " from Parentname class"
  end

  def child_name
    self.name
  end
end


fishy = Fish.new("King fish")
puts "Initialised Fish  instance"
puts fishy.speak           # => Sparky says arf!
puts "parent name is " +  fishy.parent_name
puts "child name is " + fishy.child_name


#If the parent only has initialize, then while the child is initialised then parent is called,
# but we need to make sure that alll the params are sent to parent initlaise while creating new

class Elephant < Animal

  def name_parent
    puts "#{self.name} says arf!"
    name + " from Parent class"
  end
end


paws = Elephant.new("Jumbo")
puts "Initialised Elephant instance"
