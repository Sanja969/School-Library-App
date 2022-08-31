require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
