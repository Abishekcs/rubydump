class Document
  def initialize(text)
    @text = text
  end

  class << self

    INVALID_ATTRIBUTE_NAMES = [:Hello, :World]

    def introduction(*names)
      puts "Graph Theory With Applications To Engineering And Computer Science"
      names_to_sym = names.map(&:to_sym) & INVALID_ATTRIBUTE_NAMES
      puts "This are the names passed to introduction #{names_to_sym}"
    end
  end
end

my_object = Document.new('War and Peace')

class Current < Document
  introduction 'Abishek', :Das, :CSE, :Hello, :World
end
