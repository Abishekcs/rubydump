class Text
  def self.intro
    name.to_sym
    puts singleton_class
  end

  def self.details
    puts "Books Like: Hobbit, Throne Of Glass"

  end
end


class Print < Text
  intro
end

puts Print.details
