require '.person'

class Teacher < Person
  def initialize(specialization, name = 'unknown', age, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
