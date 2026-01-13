require './second_example_use_of_delegation_class.rb'

class Stack < DelegateClass(Array)
  def initialize(initial_items = [])
    super(initial_items)
  end
end

stack_sample = Stack.new

stack_sample.push(1)
