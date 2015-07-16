class Zombie
  attr_accessor :name
  
  def initialize
    @name = 'Ash'
    @brains = 0
  end
  
  def hungry?
    true
  end
end