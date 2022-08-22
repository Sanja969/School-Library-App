class Teacher < Person
  def initialize(name, age, specialization)
    @specialization = specialization
    super(name, age)
  end

  def can_use_services?
    true
  end
end
