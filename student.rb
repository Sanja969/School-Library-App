class Student < Person
  def initialize(name, age, classroom)
    @classroom = classroom
    super(name, age)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
