require './book'
require './person'
require './teacher'
require './student'
require './rental'
require './classroom'
require './capitalize_decorator'
require './trimmer_decorate'
require './data/preserved_data'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'You need to add a book! Please add...' if @books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts
    puts
  end

  def list_all_people
    puts 'No people to show yet! Please add a teacher or student' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, id: #{person.id}, Age: #{person.age}" }
    puts
    puts
  end

  def create_a_person
    print 'Do you want to create a teacher (1) or student (2)? [Input the number]: '
    option = gets.chomp

    case option
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Enter a valid option'
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specializaation = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people << teacher

    save_teacher(specialization, age, name)

    puts 'Teacher created successfully'
    puts
    puts
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission == 'Y'

    student = Student.new(age, name, parent_permission)
    @people << student

    save_student(classroom, age, name, parent_permission)

    puts 'Student created successfully'
    puts
    puts
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    save_book(title, author)

    puts 'Created book successfully'
    puts
    puts
  end

  def create_a_rental
    puts 'Select a book from the list'

    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the list (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, id: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    save_rental(date, person_id, book_id)

    puts 'Created rental successfully'
    puts
    puts
  end

  def list_rentals_by_person_id
    print ' id of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    puts
    puts
  end

  def load_preserved_data
    load_people @people
    load_books @books
    load_rentals @rentals
  end

  # def show_data
  # p @people
  # p @books
  # p @rentals
  # end
end
