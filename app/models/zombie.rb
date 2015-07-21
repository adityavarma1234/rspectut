class Zombie < ActiveRecord::Base
  validates :name, presence: true
  has_one :weapon
  
  def decapitate
    weapon.slice(self, :head)
    self.status = "dead again"
  end
  
  def geolocate
    loc = Zoogle.graveyard_locator(self.graveyard)
    "#{loc[:latitude]}, #{loc[:longitude]}"
  end
end