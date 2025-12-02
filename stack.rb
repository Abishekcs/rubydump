require './stack_like_module'

class Stack
  include Stacklike
end

stack_object = Stack.new

stack_object.add_to_stack('First Melon')
stack_object.add_to_stack('Second Melon')
stack_object.add_to_stack('Third Melon')

puts stack_object.stack

take_out_third_melon_from_stack = stack_object.take_from_stack

print "Third Melon taken out of the stack #{take_out_third_melon_from_stack} \n"

puts Stack.ancestors
