class Document
  def initialize(text)
    @text = text
  end

  class << self
    puts "My self"
  end
end

my_object = Document.new('War and Peace')

def my_object.explain
  puts "self is #{self}"
  puts "and it's class is #{self.class}"
end

my_object.explain

my_object = Document

def my_object.explain
  puts "self is #{self}"
  puts "and its class is #{self.class}"
end

my_object.explain
