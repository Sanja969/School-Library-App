require_relative '../book'
require_relative '../person'
require 'yaml'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'returns a new book object' do
      expect(@book).to be_an_instance_of Book
    end
    it 'throws an ArgumentError when given fewer than 2 parameters' do
      expect { Book.new 'Title' }.to raise_exception ArgumentError
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Author'
    end
  end

  describe '#add_rental' do
    it 'add new rental with this book and given person' do
      expect(@book.add_rental(Person.new(20, 'name1'), '2021/12/11')).to be_an_instance_of Rental
      expect(@book.add_rental(Person.new(20, 'name2'), '2021/12/11').book.title).to eql 'Title'
      expect(@book.rentals.length).to eql 2
    end
  end
end
