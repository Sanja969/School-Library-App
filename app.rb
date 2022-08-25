require './book'
require './student'
require './teacher'

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
    @people.map do |person|
      p "#{person.class.name} Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    loop do
      print 'Do you want to create student (1) or a teache (2)? [Input the number]: '
      choice = gets.chomp
      print 'Age: '
      age = gets.chomp

      print 'Name: '
      name = gets.chomp

      if choice == '1'
        print 'Classroom: '
        classroom = gets.chomp
        @people << Student.new(age, name, classroom)
      end

      if choice == '2'
        print 'Specialization: '
        specialization = gets.chomp
        @people << Teacher.new(age, name, specialization)
      end
      break if %w[1 2].include? choice
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end
end

# book1 = Book.new('sanjati', 'Sanja')
# book2 = Book.new('iiiii', 'Iva')
# list = [book1, book2]
# app = App.new
# app.list_books(list)

# p defined?(a).nil?

# student1 = app.create_person(19, 'Aca', 12)
# teache1 = app.create_person(40, 'Tom', 'Writer')
# lists = [student1, teache1]

# app.list_people(lists)
