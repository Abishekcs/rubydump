require 'forwardable'

class Formattter
  def format(text)
    puts "Formatter Checking In #{text}"
  end

  def holidays
    puts "12 December 25 Christmas 31 New Year"
  end

end

class Printer
  extend Forwardable

  def_delegators :@formatter, :format, :holidays

  def initialize(formatter)
    @formatter = formatter
  end

  def print(text)
    formatted_text = format(text)
    holidays
    puts formatted_text
  end
end

Pr = Printer.new(Formattter.new)

Pr.print('Hello, From Formatter We are using forwardable')
