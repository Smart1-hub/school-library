class Person
  attr_accessor: name, age
  attr_writer: id
  def initialize(name = 'unknown', age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def is_of_age
    @age >= 18
  end

  def can_use_services?
    @parent_permission
  end
end