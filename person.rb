require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name)
    @id = Time.now.to_f
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

# person = Person.new(22, 'maximilianus')
# p person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name
