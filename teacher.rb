require '.person'

class Teacher < Person
  def initialize(specialization, name = 'unknown', age, parent_permission: true)
    @specialization = specialization
  end
end