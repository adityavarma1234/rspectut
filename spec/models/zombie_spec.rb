require "spec_helper"
require "zombie"

describe Zombie do
  
  # it 'responds to name' do
  #   zombie = Zombie.new
  #   zombie.should respond_to(:name)
  # end
  
  #only works using describe with a class
  # it 'responds to name' do
  #   # subject = Zombie.new
  #   subject.should respond_to(:name)
  # end
  
  #subject is created automatically
  # it 'responds to name' do
  #   should respond_to(:name)
  # end
  
  # it "responds to name" { should respond_to(:name) }
  
  #generated output that is readable
  it { should respond_to(:name) } 
  
  it "is invalid without a name" do
    zombie = Zombie.new
    #predicate matcher
    zombie.should_not be_valid
  end

  # it "is named Ash" do
  #   zombie = Zombie.new
  #   zombie.name.should == 'Ash'
  # end
  
  # it { subject.name.should == 'Ash' }
  
  its(:name) { should == 'Ash' }
  
  its(:weapons) { should include(weapon) }
  
  its(:brain) { should be nil }
  
  #string (tweets.size) will get evaluated and the result will be tested
  its('tweets.size') { should == 2}
  
  it "has no brains" do
    zombie = Zombie.new
    zombie.brains.should < 1
  end

  it "is hungry" do
    zombie = Zombie.new
    zombie.should be_hungry
  end
  
  #duplication
  # it "craves brains when hungry"
  # it "with a veggie preference still craves brains when hungry"
  # it "with a veggie preference prefers vegan brains when hungry"
  
  #remove duplication (but when hungry duplication)
  # it 'craves brain when hungry'
  # describe "with a veggie preference" do
  #   it "still craves brain when hungry"
  #   it "prefers vegan brains when hungry"
  # end
  
  # describe 'when hungry' do
  #   it 'craves brains'
  #   describe 'with a veggie preference' do
  #     it 'still craves brains'
  #     it 'prefers vegan brains'
  #   end
  # end
  
  #context instead of describe
  context 'when hungry' do
    it 'craves brains'
    context 'with a veggie preference' do
      it 'still craves brains'
      it 'prefers vegan brains'
    end
  end
  
  # context 'with a veggie preference' do
  #   subject { Zombie.new( vegetarian: true ) }
  #   
  #   it 'craves vegan brains' do
  #     craving.should == 'vegan brains'
  #   end
  # end

  context 'with a veggie preference' do
    subject { Zombie.new( vegetarian: true ) }
    
    its(:craving) {should == 'vegan brains'}
  end
  
  # context 'with a veggie preference' do
  #   let(:zombie) { Zombie.new(vegetarian: true, weapons: [axe]) }
  #   let(:axe) {Weapon.new(name: 'axe')}
  #   subject { zombie } 
  #   
  #   its(:weapons) {should include(axe)}
  #   
  #   it 'can use its axe' do
  #     zombie.swing(axe).should == true
  #   end
  # end

  context 'with a veggie preference' do
    subject(:zombie) { Zombie.new(vegetarian: true, weapons: [axe]) }
    let(:axe) {Weapon.new(name: 'axe')}
    
    its(:weapons) {should include(axe)}
    
    it 'can use its axe' do
      zombie.swing(axe).should == true
    end
  end

  #metadata and filters
  context 'when hungry' do
    it 'craves brains'
    #only this test will run if we use
    # rspec --tag focus spec/lib/zombie_spec.rb or we can use spec_helpers
    context 'with a veggie preference', focus: true do
      it 'still craves brains'
      it 'prefers vegan brains', vegan: true
    end
  end
end