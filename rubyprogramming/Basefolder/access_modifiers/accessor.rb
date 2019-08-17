# The last thing we want to cover is something that's actually
# quite simple, but necessary. Right now, all the methods in
# our GoodDog class are public methods. A public method is a
# method that is available to anyone who knows either the
# class name or the object's name. These methods are readily
# available for the rest of the program to use and comprise
# the class's interface (that's how other classes and objects
# will interact with this class and its objects).
#
# Sometimes you'll have methods that are doing work in the
# class but don't need to be available to the rest of the program.
# These methods can be defined as private. How do we define
# private methods? We use the reserved word private in our program
# and anything below it is private (unless another reserved word
# is placed after it to negate it).
#
# In our GoodDog class we have one operation that takes place
# that we could move into a private method. When we initialize
# an object, we calculate the dog's age in Dog years. Let's refactor this logic into a method and make it private so nothing outside of the class can use it.

class GoodDog1
    DOG_YEARS = 7

    attr_accessor :name, :age

    def initialize(n, a)
      self.name = n
      self.age = a
    end

    def public_disclosure
      "#{self.name} in human years is #{human_years}"
    end

    private

    def human_years
      age * DOG_YEARS
    end
end
sparky = GoodDog1.new("Sparky", 4)
sparky.human_years
# We get the error message:
#
#                          NoMethodError: private method `human_years' called for
#   #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>
# We have made the human_years method private by placing it under the private reserved word. So what is it good for if we can't call it? private methods are only accessible from other methods in the class. For example, given the above code, the following would be allowed:
#
# # assume the method definition below is above the "private" keyword


# Note that in this case, we can not use self.human_years, because the human_years method is private. Remember that self.human_years is equivalent to sparky.human_years, which is not allowed for private methods. Therefore, we have to just use human_years. In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without self.
#
# Public and private methods are most common, but in some less common situations, we'll want an in-between approach. We can use the protected keyword to create protected methods. The easiest way to understand protected methods is to follow these two rules:
#
# from outside the class, protected methods act just like private methods.
# from inside the class, protected methods are accessible just like public methods.
# Let's take a look at some examples:

class Animals
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end
# Study the above code, as it's a little complicated. We'll create an Animal object and test it out.

fido = Animals.new
fido.a_public_method        # => Will this work? Yes, I'm protected!
# The above line of code shows us that we can call a protected method from within the class, even with self prepended. What about outside of the class?

fido.a_protected_method
  # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>
# This demonstrates the second rule, that we can't call protected methods from outside of the class. The two rules for protected methods apply within the context of inheritance as well.

        # There are some exceptions to this rule, but we won't worry about that yet. If you remember those two rules about protected methods, that should be good enough for the time being.

