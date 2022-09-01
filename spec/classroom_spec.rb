require_relative '../classroom'
require 'yaml'

describe Classroom do
  before :each do
    @classroom = Classroom.new 22
  end

  describe '#new' do
    it 'returns a new classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
    it 'throws an ArgumentError when no parameters given' do
      expect { Classroom.new }.to raise_exception ArgumentError
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eql 22
    end
  end

  describe '#students' do
    it 'list of students before add_student method is called' do
      expect(@classroom.students).to eql []
    end
    it 'list of students after add_student method is called with Student object as argument' do
      @classroom.add_student(Student.new(20, 'anja', 12))
      expect(@classroom.students.length).to eql 1
      expect(@classroom.students[0].name).to eql 'anja'
    end
  end
end
