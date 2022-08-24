require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom)
    @classroom = classroom
    super(age, name)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

class1 = Classroom.new(333)
# p class1.students

sanja = Student.new(19, 'Sanja', 22)
class1.add_student(sanja)
# p class1.students
# sanja.classroom = 333
# p class1.students

sanja.classroom = 222

p sanja.classroom