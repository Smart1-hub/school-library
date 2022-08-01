require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @decorate = nameable
  end

  def correct_name
    @decorate.correct_name
  end
end
