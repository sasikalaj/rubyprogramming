# //https://cbabhusal.wordpress.com/2015/03/26/ruby-ruby-dot-and-double-colon-operators/#targetText=Ruby%20dot%20“.”%20and%20double,module%20name%20and%20two%20colons.&targetText=Remember%3A%20in%20Ruby%2C%20classes%20and,may%20be%20considered%20constants%20too.
# https://docs.ruby-lang.org/en/2.2.0/syntax/modules_and_classes_rdoc.html
#
#
# -- Here the HelperExample is not defined within Utils module namespace
# -- It is required to include require in this script otherwise Utils will not know
# -- where the Helper example is decalred
# -- The main resaon for this example is to prove that modules thats are not
# -- declared within the same namespace can be extended. It is not required that
# -- helperexample module to be declared under Utils. It can also be declared within the namespace.
# -- Both the above scenarios will yield the same results
# -- Also note that we are able to directly access which_helper method
# -- that is declared inside the Helperexample with Utils prefix
# -- as in Utils.Helperexample becuase once you extends a module it
# -- automatically becomes the class method of the extedning module
# -- or class. So the methods in the module Helperexmaple are
# -- given self status inside Utils
require "../../Basefolder/modules_and_classes/helper_example"

module Utils
  extend Helperexample
  def direct_util_module_method
    puts "inside direct util module method"
  end

  def self.self_util_module_methods
    puts "inside self util module method"
  end
end

Utils.which_helper
Utils.self_util_module_methods
Utils.direct_util_module_method