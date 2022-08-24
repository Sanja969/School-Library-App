require './person'
require './book'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end

book1 = Book.new('first', 'auth1')
person1 = Person.new(19, 'ana')
person2 = Person.new(19, 'iva')

Rental.new(Time.now, book1, person1)
Rental.new(Time.now, book1, person2)

p book1.rentals.count
p book1.rentals.map(&:date)

book1.add_rental(person1, Time.now)
p book1.rentals.map(&:date)
