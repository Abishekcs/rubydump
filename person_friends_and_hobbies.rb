class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends
  
  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def has_hobby(hobby)
    @hobbies << hobby
  end

  def has_friend(friend)
    @friends << friend
  end


  def self.method_missing(m, *args)
    method_name = m.to_s
    if method_name.start_with?("all_with_")
      attr = method_name[9..-1]
      if Person.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Can't find #{attr}"
      end
    else
      super
    end
  end

end

person = Person.new('Abishek')

j = Person.new("John")
p = Person.new("Paul")
g = Person.new("George")
r = Person.new("Ringo")

j.has_friend(p)
j.has_friend(g)
g.has_friend(p)
r.has_hobby("rings")

Person.all_with_friends(j)&.each do |person|
  puts "#{person.name} is friends with #{p.name}"
end

# Person.all_with_hobbies("rings").each do |person|
#  puts "#{person.name} is into rings"
# end


