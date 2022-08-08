# rubocop: disable Style/OptionalBooleanParameter
require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @id = Random.rand(1...1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# rubocop: enable Style/OptionalBooleanParameter
