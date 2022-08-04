require './app'

def run
  puts 'Welcome to School Library App!'
end

def option_menu(app)
  puts 'Please choose an option by entering a number!'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'

  option = gets.chomp

  case option
  when '1'
    app.list_all_books
    option_menu app
  when '2'
    app.list_all_people
    option_menu app
  when '3'
    app.create_a_person
    option_menu app
  when '4'
    app.create_a_book
    option_menu app
  when '5'
    app.create_a_rental
    option_menu app
  when '6'
    app.list_rental_by_person_id
    option_menu app
  when '7'
    puts 'Thanks for choosing the School Library App'
  else
    puts 'Please enter any number from 1 to 7'
  end
end

def main
  app = App.new
  run
  option_menu app
end

main
