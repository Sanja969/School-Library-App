require './person'

class Student < Person
  def initialize(age, name, classroom)
    @classroom = classroom
    super(age, name)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
