require_relative '../student'
require 'yaml'

describe Student do
  it 'should inherit behavior from Person' do
    expect(Student.superclass).to eq(Person)
  end
  before :all do
    @student = Student.new 20, 'name', 12
  end

  describe '#new' do
    it 'returns a new student object' do
      expect(@student).to be_an_instance_of Student
    end
    it 'throws an ArgumentError when given fewer than 3 parameters' do
      expect { Student.new 13, 'name' }.to raise_exception ArgumentError
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      expect(@student.age).to eql 20
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@student.name).to eql 'name'
    end
  end

  describe '#classroom' do
    it 'returns the correct age' do
      expect(@student.classroom).to eql 12
    end
  end
end
