require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    super()
    @rentals = []
  end

  def can_use_services?
    _is_of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def _is_of_age?
    @age >= 18
  end
end
