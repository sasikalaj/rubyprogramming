# Extending Specific Objects with Modules
# Credit: Phil Tomson
# The extend method is used to mix a module’s methods into an object,
# while include is used to mix a module’s methods into a class.

# Problem
# You want to add instance methods from a module (or modules) to specific objects.
# You don’t want to mix the module into the object’s class,
# because you want certain objects to have special abilities.
# Solution
# Use the Object#extend method.
#
# For example, let’s say we have a mild-mannered Person class:

class Person
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name, @age, @occupation = name, age, occupation
  end

  def mild_mannered?
    true
  end

end

# Now let’s create a couple of instances of this class:
puts "********** Person Class *******************"
jimmy = Person.new('Jimmy Olsen', 21, 'cub reporter')
clark = Person.new('Clark Kent', 35, 'reporter')
puts jimmy.mild_mannered?                        # => true
puts clark.mild_mannered?                        # => true
puts "********** Person Class *******************"


# But it happens that some Person objects are not as mild-mannered as they might appear.
# Some of them have superpowers:
module SuperPowers
  attr_reader :var1

  Constant_1 = "Hello world"
  def fly
    @var1 = "attr_reader value"
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

# If we use include to mix the SuperPowers module into the Person class,
# it will give every person superpowers. Some people are bound to misuse such power.
# Instead, we’ll use extend to give superpowers only to certain people:

puts "********** Super human module ********************"
clark.extend(SuperPowers)
puts clark.var1                             # => attr_reader value
puts clark.superhero_name                   # => "Superman"
puts clark.fly                              # => "Flying!"
puts clark.var1                             # => attr_reader value
# clark.Constant_1                          # => failed undefined variable Constant_1
puts clark.mild_mannered?                   # => false it is overriden method from module
puts jimmy.mild_mannered?                   # => true
puts "********** Super human module ********************"

# puts Person.superhero_name  # => failes as the extend appy to only clark instane of Person
# and not class itself or for the other instance like jimmy

# The extend method is used to mix a module’s methods into an object,





