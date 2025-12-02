class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price

  VENUES = ['Town Hall', 'Dimapur Club', 'Lions Club']
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def event
    "Can't really be specified yet..."
  end

  def self.who_am_i
    puts "Hello, I am the ticket class."
  end
 
end

Ticket.who_am_i
puts Ticket::VENUES[0]

ticket = Ticket.new("Rainbow Boat", "Tuesday 20:29")
ticket.price = 3000.456

puts "Event #{ticket.event}"
print "Venue is: #{ticket.venue} and will be held on date: #{ticket.date} \n"
print "Ticket Price: $#{"%.2f"  %  ticket.price} \n"
