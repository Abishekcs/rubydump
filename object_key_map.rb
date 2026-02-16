require 'objspace'

map = ObjectSpace::WeakKeyMap.new
val = Time.new(2026, 2, 16)
key = "Todays Time"
map[key] = val

puts map[key]

val = nil

GC.start

puts map[key]
