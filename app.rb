require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'Book list is empty! Add a book.' if @books.empty?
    @books.map do |book|
      puts %(Title: "#{book.title}", Author: #{book.author})
    end
  end

  def list_people
    puts 'People list is empty! Add a person.' if @people.empty?
    people.map do |person|
      p "#{person.class.name} Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    print 'Do you want to create student (1) or a teache (2)? [Input the number]: '
    choice = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    create_student(age, name) if choice == '1'
    create_teacher(age, name) if choice == '2'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title author)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts %(#{index}\) Title: "#{book.title}", Author: #{book.author}) }
    book_index = gets.chomp.to_i

    puts 'Select a person from the list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'

    @rentals.each do |rental|
      if rental.person.id == id
        puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author})
      else
        puts 'No rentals where found for the given ID'
      end
    end
  end

  private

  def create_student(age, name)
    print 'Classroom: '
    classroom = gets.chomp
    @people << Student.new(age, name, classroom)
    puts 'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts 'Teacher created successfully'
  end
end
