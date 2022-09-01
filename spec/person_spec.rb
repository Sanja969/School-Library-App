require_relative '../person'
require 'yaml'

describe Person do
  before :each do
    @person = Person.new 20, 'name'
  end

  describe '#new' do
    it 'returns a new person object' do
      expect(@person).to be_an_instance_of Person
    end
    it 'throws an ArgumentError when given fewer than 2 parameters' do
      expect { Person.new 13 }.to raise_exception ArgumentError
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eql 20
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql 'name'
    end
  end

  describe '#add_rental' do
    it 'add new rental with this person object and given person' do
      expect(@person.add_rental(Book.new('Title1', 'Author1'), '2021/12/11')).to be_an_instance_of Rental
      expect(@person.add_rental(Book.new('Title2', 'Author2'), '2021/12/11').person.name).to eql 'name'
      expect(@person.rentals.length).to eql 2
    end
  end

  describe '#can_use_services?' do
    it 'can use services return true if user is older than 18' do
      expect(@person.can_use_services?).to eql true
      @person1 = Person.new 16, 'aca'
      expect(@person1.can_use_services?).to eql false
    end
  end
end
