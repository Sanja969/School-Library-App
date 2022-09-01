require_relative '../teacher'
require 'yaml'

describe Teacher do
  it 'should inherit behavior from Person' do
    expect(Teacher.superclass).to eq(Person)
  end
  before :all do
    @teacher = Teacher.new 20, 'name', 'art'
  end

  describe '#new' do
    it 'returns a new teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'throws an ArgumentError when given fewer than 3 parameters' do
      expect { Teacher.new 13, 'name' }.to raise_exception ArgumentError
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      expect(@teacher.age).to eql 20
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@teacher.name).to eql 'name'
    end
  end

  describe '#classroom' do
    it 'returns the correct age' do
      expect(@teacher.age).to eql 20
    end
  end
end
