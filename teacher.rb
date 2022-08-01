require '.person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission
  
  def initialize(specialization, name = 'unknown', age, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
