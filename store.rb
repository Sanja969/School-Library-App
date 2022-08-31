module Store
  def load
    books_file = File.exist?('./books.json') ? File.read('./books.json') : '[]'
    people_file = File.exist?('./people.json') ? File.read('./people.json') : '[]'
    rentals_file = File.exist?('./rentals.json') ? File.read('./rentals.json') : '[]'
    book_h = JSON.parse(books_file)
    people_h = JSON.parse(people_file)
    rentals_h = JSON.parse(rentals_file)
    update_books(book_h)
    update_people(people_h)
    update_rentals(rentals_h)
  end

  private

  def update_books(book_h)
    return if book_h == []

    book_h.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def update_people(people_h)
    return if people_h == []

    people_h.each do |person|
      @people << Student.new(person['age'], person['name'], person['classrooom']) if person['type'] == 'Student'
      @people << Teacher.new(person['age'], person['name'], person['specialization']) if person['type'] == 'Teacher'
    end
  end

  def update_rentals(rentals_h)
    rentals_h.each do |rental|
      check_books(rental)
      check_people(rental)
      @people.each do |person|
        @person_r = person if rental['person'] == person.name
      end
      @rentals << Rental.new(rental['date'], @book_r, @person_r) if @book_r && @person_r
    end
  end

  def check_books(rental)
    @books.each do |book|
      @book_r = book if rental['book_title'] == book.title
    end
  end

  def check_people(rental)
    @books.each do |book|
      @book_r = book if rental['book_title'] == book.title
    end
  end
end
