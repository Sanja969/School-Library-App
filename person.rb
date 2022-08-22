class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age)
    @id = Time.now.to_f
    @name = name
    @age = age
  end

  def can_use_services?
    _is_of_age?
  end

  private

  def _is_of_age?
    @age >= 18
  end
end
