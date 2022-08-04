# rubocop:disable Metrics

require './app'

def run
  puts 'Welcome to School Library App!'
  puts
  puts
end

def option_menu(myapp)
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
    myapp.list_all_books
    option_menu myapp
  when '2'
    myapp.list_all_people
    option_menu myapp
  when '3'
    myapp.create_a_person
    option_menu myapp
  when '4'
    myapp.create_a_book
    option_menu myapp
  when '5'
    myapp.create_a_rental
    option_menu myapp
  when '6'
    myapp.list_rental_by_person_id
    option_menu myapp
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

# rubocop:enable Metrics
