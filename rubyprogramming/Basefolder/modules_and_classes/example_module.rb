# #!/usr/local/bin/ruby
#
# # Class cannot be extended or included
# # Only modules can be extended and included
# # Class can extend and include a module
# # Can a module can include or extend another module
# module ActiveRecord
#     class Base
#         def self.validates_presence_of(...)
#             puts "inside Active record"
#         end
#     end
# end
#
# module Parentclass
#     class Base
#         class << self
#             def instance_variable
#                 @base_instance_variable = "base_instance"
#                 puts "inside Active record"
#             end
#
#     end
# end
#
# class Foo < ActiveRecord::Base
#       validates_presence_of :bar
# end
#
# Foo.validates_presence_of
# ActiveRecord::Base.validates_presence_of
#
# Modules can extend another module
