# The astute reader might point out that classes are actually objects in Ruby.
# Let’s see what happens when we use extend in a class definition:

# What exactly are we extending here? Within the class definition,
# extend is being called on the Human class itself;
# we could have also written self.extend(SuperPowers).
# We’re extending the Human class with the methods defined in SuperPowers.
# This means that the methods defined in the SuperPowers module have now become class methods of Human:

module SuperPowers

  Constant_1 = "I am constant_1 outside of any method"

  constant_2 = "I am a humble variable outside any methods not contants or instance variable or class variable or global variable"

  @instance_var_outside_any_method = "@instance var outside any method"

  @@class_var_outside_any_method = "@@class_var_outside_any_method"

  def superhero_name
    'Superman'
  end

  def fly
    @instance_var_inside_instance_slash_class_method = "@instance var inside instance_slash_class method"
    @@class_var_inside_instance_slash_class_method = "@@class_var_inside_instance_slash_class_method"
    'Flying!'
  end

  def leap(what)
    "Leaping #{what} in a single bound!"
  end

  def mild_mannered?
    @instance_var_inside_instance_method_to_override = "@instance var inside instance method that would override"
    @@class_var_inside_instance_method_to_override = "@@class_var_inside_instance_method_to_override"
    false
  end

  def self.its_my_method_from_module
    @instance_var_inside_module_self_method_to = "@instance var inside modules own self"
    @@class_var_inside_module_self_method_to = "@@class_var_inside_module_self_method_to"
    "this is modules self method"
  end
end

class Human
  extend SuperPowers

  # attr_reader :name, :age, :occupation

  CONSTANT_DEFINED_INSIDE_CLASS_OUTSIDE_METHOD = "CONSTANT_DEFINED_INSIDE_CLASS_OUTSIDE_METHOD"

  variable_defined_inside_class_outside_method = "variable_defined_inside_class_outside_method"

  @instance_variable_defined_inside_class_outside_method = "instance_variable_defined_inside_class_outside_method"

  def initialize(name, age, occupation)
    @name, @age, @occupation = name, age, occupation
  end

  def mild_mannered?
    true
  end

  def extra
    puts " This is inside the Human class extra "
    @instance_variable_defined_inside_class_inside_method = "@instance_variable_defined_inside_class_inside_method"
  end

  def self.self_method_to_access_variables
    @instance_variable_defined_inside_class_inside_self_method = "@instance_variable_defined_inside_class_inside_self_method"
    puts Constant_1
    puts constant_2
    puts instance_var_outside_any_method
    puts instance_var_inside_instance_slash_class_method
    puts instance_var_inside_instance_method_to_override
    puts instance_var_inside_module_self_method_to
  end

  def self.self_method_to_access_class_variables
    # puts @@class_var_outside_any_method # not initialised
    # puts @@class_var_inside_instance_slash_class_method # not initialised
    # puts @@class_var_inside_instance_method_to_override # not initialised
    # puts @@class_var_inside_module_self_method_to  # not initialised
  end

  def self.self_method_to_access_instance_variables
    puts @instance_var_outside_any_method
    puts @instance_var_inside_instance_slash_class_method
    puts @instance_var_inside_instance_method_to_override
    puts @instance_var_inside_module_self_method_to
  end

  def instance_method_to_access_variables
    puts Constant_1
    puts constant_2
    puts instance_var_outside_any_method
    puts instance_var_inside_instance_slash_class_method
    puts instance_var_inside_instance_method_to_override
    puts instance_var_inside_module_self_method_to
  end

  def instance_method_to_access_instance_variables
    puts @instance_var_outside_any_method
    puts @instance_var_inside_instance_slash_class_method
    puts @instance_var_inside_instance_method_to_override
    puts @instance_var_inside_module_self_method_to
  end

end
# class Human extend SuperPowers
# is equal to addding the SuperPowers methods as self.methods of class Human.
# That is why, we are able to access the methods defined inside the superpowers
# with the class identifier as in Human.fly. Here Human is the class name but fly
# is the method inside the module and we are able to access them without instance of Human created
# Only execption is self methods of the module cannot be accessed by the class that extends it with class qualifier

puts "********** Human Class accessing methods of extended module - start *******************"
puts Human.superhero_name                 # => "Superman"
puts Human.fly                            # => "Flying!"
puts Human.leap("what??")           # => "Flying!"
puts Human.mild_mannered?                 # => false since it overriden methof from modules
# puts Human.its_my_method_from_module    # => Since it is defined as self it is neither instance or class method , It is modules own method
# puts Human.extra                        # => Failed because it is an instance method defined inside the class
puts "********** Human Class accessing methods of extended module end *******************"


puts "********** Human Class accessing constant and instance variables of extended module - start *******************"
# puts Human::Constant_1                                       # => "uninitialized constant Human::Constant_1 (NameError)"
# puts Human::constant_2                                       # => "undefined method `constant_2' for Human:Class (NoMethodError)!"
# puts Human.instance_var_outside_any_method                   # => "undefined method `instance_var_outside_any_method' for Human:Class (NoMethodError)!"
# puts Human.instance_var_inside_instance_slash_class_method   # => "undefined method `instance_var_inside_instance_slash_class_method' for Human:Class (NoMethodError"
# puts Human.instance_var_inside_instance_method_to_override   # => "undefined method `instance_var_inside_instance_method_to_override' for Human:Class (NoMethodError"
# puts Human.instance_var_inside_module_self_method_to         # => "undefined method `instance_var_inside_module_self_method_to' for Human:Class (NoMethodError)"
# same results while using :: to access these variables. The monent it sees the lowercase as first letter in variable name it assumes it as method
#puts Human.self_method_to_access_variables                   # => Method was accessible but None of the variables were accessible
# puts Human.instance_method_to_access_variables              # => It is an instance method so cannot be accessed undefined method `instance_method_to_access_variables'
puts Human.self_method_to_access_instance_variables
outs Human.self_method_to_access_class_variables
puts "********** Human Class accessing constant and instance variables of extended module - end *******************"

# class variable declared inside the modules are class variable of the class Module not for the classes that extend it
puts "********** Human Class accessing class variables of extended module - start *******************"
# puts Human::class_var_outside_any_method                    # => both . and :: "undefined method `class_var_outside_any_method"
# puts Human::class_var_inside_instance_slash_class_method   # => both . and ::  undefined method `class_var_inside_instance_slash_class_method' for Human:Class)!"
# puts Human::class_var_inside_instance_method_to_override      # => both . and ::"undefined method `class_var_inside_instance_method_to_override' for Human:Class"
# puts Human::class_var_inside_module_self_method_to    # => "undefined method `class_var_inside_module_self_method_to' for Human:Class"
puts "********** Human Class accessing class variables of extended module - end *******************"


puts "********** Human Class accessing variables defined inside it - start *******************"
# puts Human::CONSTANT_DEFINED_INSIDE_CLASS_OUTSIDE_METHOD     # => "uninitialized constant Human::Constant_1 (NameError)"
# puts Human::variable_defined_inside_class_outside_method     # => "undefined method `constant_2' for Human:Class (NoMethodError)!"
# puts Human.instance_variable_defined_inside_class_outside_method                   # => "undefined method `instance_var_outside_any_method' for Human:Class (NoMethodError)!"
# puts Human.instance_var_inside_instance_slash_class_method   # => "undefined method `instance_var_inside_instance_slash_class_method' for Human:Class (NoMethodError"
# puts Human.instance_var_inside_instance_method_to_override   # => "undefined method `instance_var_inside_instance_method_to_override' for Human:Class (NoMethodError"
# puts Human.instance_var_inside_module_self_method_to         # => "undefined method `instance_var_inside_module_self_method_to' for Human:Class (NoMethodError)"
# same results while using :: to access these variables. The monent it sees the lowercase as first letter in variable name it assumes it as method
# puts Human.self_method_to_access_variables                   # => None of the variables were accessible
# puts Human.instance_method_to_access_variables              # => It is an instance method so cannot be accessed undefined method `instance_method_to_access_variables'
puts "********** Human Class accessing variables defined inside it - end *******************"


human1 = Human.new('Jimmy Olsen', 21, 'cub reporter')

puts "********** Human Class instance human1 accessing methods of extended module - start *******************"
# puts human1.superhero_name                   # => "undefined method `superhero_man' for #<Human:0x007fb492a08f18> (NoMethodError)"
# puts human1.fly                              # => "undefined method `fly' for #<Human:0x007fb492a08f18> (NoMethodError)!"
# puts human1.leap("what??")                   # => "undefined method `leap' for #<Human:0x007faf3b9acf30> (NoMethodError)!"
puts human1.mild_mannered?                     # => true note: this gets the non-overridden version of the method from class and not from module??
# puts human1.its_my_method_from_module        # => Since it is defined as self it is neither instance or class method , It is modules own method
puts human1.extra                              # => This is inside the Human class extra
# puts human1.self_method_to_access_variables  # => "undefined method `self_method_to_access_variables". it is specific to class
# puts human1.instance_method_to_access_variables # => method was accessible, but none of the variables was
puts "********** Human Class instance human1 accessing method of extended module end *******************"

puts "********** Human Class instance human1 accessing variables defined inside it - start *******************"
# puts human1::CONSTANT_DEFINED_INSIDE_CLASS_OUTSIDE_METHOD     # => "human1 is not a class or module"
# puts human1::variable_defined_inside_class_outside_method     # => "undefined method `constant_2' for human1 (NoMethodError)!"
# puts human1.instance_variable_defined_inside_class_outside_method   # => "undefined method `instance_var_outside_any_method' for human1 (NoMethodError)!"
# puts human1::instance_var_inside_instance_slash_class_method   # => "undefined method `instance_var_inside_instance_slash_class_method' for Human:Class (NoMethodError"
# puts human1.instance_var_inside_instance_method_to_override   # => "undefined method `instance_var_inside_instance_method_to_override' for Human:Class (NoMethodError"
# puts human1.instance_var_inside_module_self_method_to         # => "undefined method `instance_var_inside_module_self_method_to' for Human:Class (NoMethodError)"
# same results while using :: to access these variables. The monent it sees the lowercase as first letter in variable name it assumes it as method
# puts human1.self_method_to_access_variables                   # => None of the variables were accessible
# puts human1.instance_method_to_access_variables              # => It is an instance method can be accessed but variables were not undefined method `instance_method_to_access_variables'
puts "********** Human Class instance human1 accessing variables defined inside it - end *******************"


# class variable declared inside the modules are class variable of the class Module not for the classes that extend it
puts "********** Human Class instance human1 accessing class variables of extended module - start *******************"
# puts human1::class_var_outside_any_method                    # => both . and :: "undefined method `class_var_outside_any_method"
# puts human1::class_var_inside_instance_slash_class_method   # => both . and ::  undefined method `class_var_inside_instance_slash_class_method' for Human:Class)!"
# puts human1::class_var_inside_instance_method_to_override      # => both . and ::"undefined method `class_var_inside_instance_method_to_override' for Human:Class"
# puts human1::class_var_inside_module_self_method_to    # => "undefined method `class_var_inside_module_self_method_to' for Human:Class"
puts "********** Human Class instance human1 accessing class variables of extended module - end *******************"




