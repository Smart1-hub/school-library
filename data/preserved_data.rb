require 'json'
require './person'
require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

def load_people(the_people)
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if File.empty?('./data/people.json')
      the_people << []
    else
      people = JSON.parse(File.read('./data/people.json'))
      # p people.length()
      people.each do |person|
      # p person
      the_people << if person['type'] == 'Student'
        Student.new(person['classroom'], person['age'], person['name'], person['parent_permission'])
      else
        Teacher.new(person['specialization'], person['age'], person['name'], person['parent_permission'])
      end
    end
    file.close
   else
    the_people << []
  end
end

def load_books(the_book)
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      the_book << []
    else
      books = JSON.parse(File.read('./data/books.json'))

      books.each do |book|
        the_book << Book.new(book['title'], book['author'])
      end
    end
    file.close
  else
    the_book << []
  end
end

def load_rentals(the_rental)
  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      the_rental << []
    else
      rentals = JSON.parse(File.read('./data/rentals.json'))

      rentals.each do |rental|
        the_rental << Rental.new(rental['date'], @people[rental['person']], @books[rental['book']])
      end
    end
    file.close
  else
    the_rental << []
  end
end

def save_student(classroom, age, name, parent_permission)
  obj = {
    type: 'Student',
    classroom: classroom,
    name: name,
    age: age,
    parent_permission: parent_permission
  }

  if file.size.zero?
    student = [obj]
  else
    student = JSON.parse(File.read('./data/people.json'))
    student << obj
  end
  file.close

  the_file = File.open('./data/people.json', 'w')
  the_file.write(JSON.pretty_generate(student))
  the_file.close
end
end

def save_teacher(specializaation, age, name)
  obj = {
    type: 'Teacher',
    specializaation: specializaation,
    name: name,
    age: age,
    parent_permission: true
  }

  if File.exist?('.data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      teacher = [obj]
    else
      teacher = JSON.parse(File.read('./data/people.json'))
      teacher << [obj]
    end
    file.close

    the_file = File.open('./data/people.json', 'w')
    the_file.write(JSON.pretty_generate(teacher))
    the_file.close
  end
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')
    book << obj
  end
  file.close

  the_file = File.open('./data/books.json')
  the_file.write(JSON.pretty_generate(book))
  the_file.close
end
end

def save_rental(date, person_id, book_id)
  file = File.open('./data/rentals.json')

  if file.size.zero?
    rental = [obj]
  else
    rental = JSON.parse(File.read('./data/rentals.json'))
    rental << obj
  end
  file.close

  the_file = File.open('./data/rentals.json', 'w')
  the_file.write(JSON.pretty_generate(rental))
  the_file.close
end
end
