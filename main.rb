require './app'
require 'pry'

def main
  puts 'Welcome to my School Library!'
  @app = App.new
end

def option(input)
  case input
  when 1
    @app.list_books
  when 2
    @app.list_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rentals
  else
    puts 'You put the wrong input. Please enter a number between 1 and 7.'
  end
end

main
binding.pry
