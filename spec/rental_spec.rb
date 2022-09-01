require_relative '../rental'
require 'yaml'

describe Rental do
  before :all do
    @book = Book.new('Title', 'Author')
    @person = Person.new(20, 'name')
    @rental = Rental.new('2021/12/12', @book, @person)
  end

  describe '#new' do
    it 'returns a new rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
    it 'throws an ArgumentError when no parameters given' do
      expect { Rental.new }.to raise_exception ArgumentError
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      expect(@rental.date).to eql '2021/12/12'
    end
  end

  describe '#book' do
    it 'returns the correct book object' do
      expect(@rental.book.title).to eql 'Title'
    end
  end

  describe '#person' do
    it 'returns the correctdate' do
      expect(@rental.person.name).to eql 'name'
    end
  end

  describe '#person' do
    it 'returns the correctdate' do
      expect(@person.rentals.length).to eql 1
      expect(@book.rentals.length).to eql 1
    end
  end
end
