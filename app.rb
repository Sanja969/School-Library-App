require './book'
require './student'
require './teacher'

class App
  def list_books(books)
    books.map { |book|
    puts %(Title: "#{book.title}", Author: #{book.author}) }
  end

  def list_people(people)
    people.map do |person|
      t = defined?(person.classroom) ? '[Student]' : '[Teacher]'
      p "#{t} Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(age, name, addisional)
    addisional.instance_of?(String) ? Teacher.new(age, name, addisional) : Student.new(age, name, addisional)
  end
end

book1 = Book.new('sanjati', 'Sanja')
book2 = Book.new('iiiii', 'Iva')
list = [book1, book2]
app = App.new
app.list_books(list)

p defined?(a).nil?

student1 = app.create_person(19, 'Aca', 12)
teache1 = app.create_person(40, 'Tom', 'Writer')
lists = [student1, teache1]

app.list_people(lists)