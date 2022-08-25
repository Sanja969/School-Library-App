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

# class1 = Classroom.new(333)
# sanja = Student.new(19, 'Sanja', 22)
# p '********************************************'
# p class1.students
# p sanja.classroom

# class1.add_student(sanja)
# p '********************************************'
# p class1.students
# p sanja.classroom

# class2 = Classroom.new(353)
# sanja.classroom = class2
# p '********************************************'
# p class1.students
# p class2.students
# p sanja.classroom
