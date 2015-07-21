class Zombie < ActiveRecord::Base
  validates :name, presence: true
end