# The astute reader might point out that classes are actually objects in Ruby.
# Let’s see what happens when we use extend in a class definition:

# What exactly are we extending here? Within the class definition,
# extend is being called on the Human class itself;
# we could have also written self.extend(SuperPowers).
# We’re extending the Human class with the methods defined in SuperPowers.
# This means that the methods defined in the SuperPowers module have now become class methods of Human:

module SuperPowers

  Constant_1 = "Hello world"
  def fly
    'Flying!'
  end

  def leap(what)
    "Leaping #{what} in a single bound!"
  end

  def mild_mannered?
    false
  end

  def superhero_name
    'Superman'
  end
end

class Human
  extend SuperPowers

  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name, @age, @occupation = name, age, occupation
  end

  def mild_mannered?
    true
  end

  def extra
    'This is inside the Human class extra '
  end
end
# class Human
#   extend SuperPowers
# is equal to addding the SuperPowers methods as self.methods of class Human.
# That is why, we are able to access the methods defined inside the superpowers
# with the class identifier as in Human.fly. Here Human is the class name but fly
# is the method inside the module and we are able to access them without instance of Human created

# puts "********** Human Class *******************"
puts Human.superhero_name                        # => "Superman"
puts Human.fly                                   # => "Flying!"
puts Human.mild_mannered?                        # => false since it overriden methof from modules
# puts Human.extra                                 # => Failed because it is an instance method

human1 = Human.new('Jimmy Olsen', 21, 'cub reporter')
puts human1.mild_mannered?
puts human1.extra
# puts human1.superhero_name
# puts human1.fly



