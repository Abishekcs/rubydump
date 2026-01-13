require 'delegate'

# An Example on How to use Delegation
class PersonWrapper < SimpleDelegator
  def initialize(person, nickname, age)
    super(person) # This creates @delegate_sd_obj internally
    @nickname = nickname
    @age = age
  end

  def personal_info
    __getobj__
  end
end

# The wrapped object (what we're delegating TO)
person = { name: 'Alice', job: 'Engineer' }

# The delegator wrapper
wrapper = PersonWrapper.new(person, 'Ally', 25)

puts wrapper.personal_info
