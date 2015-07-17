require "spec_helper"
require "zombie"

describe Zombie do
  it "is invalid without a name" do
    zombie = Zombie.new
    #predicate matcher
    zombie.should_not be_valid 
  end
  
  it "is named Ash" do
  zombie = Zombie.new
  zombie.name.should == 'Ash'
  end
  
  it "has no brains" do
    zombie = Zombie.new
    zombie.brains.should < 1
  end
  
  it "is hungry" do
    zombie = Zombie.new
    zombie.should be_hungry
  end
end