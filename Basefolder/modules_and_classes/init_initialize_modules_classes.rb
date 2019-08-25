# This has all the init used inside module. There is no such default method called init for modules or classes
# This also has examples for intialize in the module

module Apple
  def init
    puts "THis is direct init under module"
  end
end

# puts Apple.init # => undefined method `init' for Apple:Module


module Orange
  attr_accessor :colour

  def init
    @colour = "Instance colour"
    puts "THis is instance init under module"
  end

  class << self
    attr_reader :class_colour,:class_taste
    def init
      @class_colour = "Class colour"
      puts "THis is class init under module"
    end
  end
end
puts "******* Inside the init examples ****************"
puts Orange.class_colour # Prints nothing since the class method init is not called by default
Orange.init

puts Orange.class_colour

class Fruit
  include Orange
end


# Fruit.colour # => failed, method not defined
fruit = Fruit.new
puts fruit.colour # => prints nothing since the instance method init is not called by default
fruit.init
puts fruit.colour # prints peach as the init has been called now


class Grapefruit
  extend Orange
end

#puts Grapefruit.class_colour # => not accessible
puts Grapefruit.colour # =>  accessible but does not print anything
Grapefruit.init
# puts Grapefruit.class_colour # => not accessible
puts Grapefruit.colour


# Intialize

puts "******* Inside the initialize  examples ****************"
module Melon
  attr_accessor :colour

  def initialize
    @colour = "instance color"
    puts "THis is instance initialize under module Melon"
  end

  def taste
    puts "I mother of melon generally taste sweet"
  end

  class << self
    attr_reader :class_colour,:class_taste
    def initialize
      @class_colour = "class colour"
      puts "THis is class initialize under module"
    end
  end

end

puts Melon.class_colour # accesible but not insialised
Melon.initialize
puts Melon.class_colour # print class colour

# puts Melon.colour # not accesible not defined

puts "******* Inside the initialize extend examples ****************"

class WaterMelon
  extend Melon

  def initialize
    puts "I am the initialize of Water melon"
    super
  end

  def taste
    puts "I water melon is not sugary"
    # super
  end
end


#WaterMelon.initialize # private metjod calles for Watermelon class
puts "Instantiating Watermelon"
watermelon = WaterMelon.new # Print only the I am the initialize of Water melon. Does not have a clue of super initialize
#watermelon.taste
# Using super inside the taste method raised no superclass method called super. Since the module melon
# is extened now the method taste inside the watermwlon is a class method and we cannot access it thru the
# instance of the watermelon
# In short the class methods defined in the class or obtained thru extending
# the module is not available to instance in anyways.
# Same rule applies to initialize as well

puts "******* Inside the initialize include examples ****************"

# For the include modules super is visible and called when called as super

class SnowMelon
  include Melon

  def initialize
    puts "I am the initialize of Snowmelon"
    super
  end

  def taste
    puts "I honey dew taste like honey"
    super
  end
end
puts "Instantiating snowmelon"
snowmelon = SnowMelon.new
snowmelon.taste

# For the include modules super initialise is not called by default, we need to instantiate it
class Honeydew
  include Melon

  def initialize
    puts "I am the initialize of Snowmelon"
  end
end

puts "Instantiating honeydew "
honeydew = Honeydew.new
honeydew.taste

module Fruits
  def initialize
    puts "I am the mother of all the fruits"
  end
end

# Include modules initialise is called by default if the child class does not have any default initialise method
# again the last include module's initaise is only called here. Below only fruit initailise is only called
class MuskMelon
  include Melon
  include Fruits
end

puts "Instantiating musk melon "
muskmelon = MuskMelon.new











