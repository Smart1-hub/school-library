# rubocop: disable Style/OptionalBooleanParameter
require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @id = Random.rand(1...1000)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end
end

# rubocop: enable Style/OptionalBooleanParameter
