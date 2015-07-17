class Zombie
  attr_accessor :name, :brains
  def initialize
    @name = 'Ash'
    @brains = 0
    @presence = true
  end
  
  def hungry?
    true
  end
end