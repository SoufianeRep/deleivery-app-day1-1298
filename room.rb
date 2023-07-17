require_relative 'patient'

class Room
  attr_reader :patients
  attr_accessor :id

  # class FullRoom < Exception; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def add(patient)
    raise StandardError, "Room is full" if full?

    patient.room = self
    @patients << patient
  end

  def full?
    @capacity == @patients.length
  end
end


room = Room.new(capacity: 2)
lisa = Patient.new(name: "lisa")
alan = Patient.new(name: "alan")
aliia = Patient.new(name: "aliia")

room.add(lisa)
room.add(alan)
# -----
# room.add(aliia)

p lisa.room
