class Patient
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end
