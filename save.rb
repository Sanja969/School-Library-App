module Save
  def save
    books_hash = []
    people_hash = []
    rentals_hash = []
    to_hash(books_hash, people_hash, rentals_hash)
    File.open('books.json', 'w') { |f| f.puts books_hash.to_json }
    File.open('people.json', 'w') { |f| f.puts people_hash.to_json }
    File.open('rentals.json', 'w') { |f| f.puts rentals_hash.to_json }
  end

  def to_hash(books_hash, people_hash, rentals_hash)
    @books.each do |book|
      books_hash << { title: book.title, author: book.author }
    end
    @people.each do |person|
      if person.instance_of?(::Student)
        people_hash <<
          { name: person.name, age: person.age, id: person.id, type: person.class.name, classroom: person.classroom }
      else
        people_hash <<
          { name: person.name, age: person.age, id: person.id, type: person.class.name,
            specialization: person.specialization }
      end
    end
    @rentals.each do |rental|
      rentals_hash <<
        { date: rental.date, book_author: rental.book.author, book_title: rental.book.title,
          person: rental.person.name }
    end
  end
end
