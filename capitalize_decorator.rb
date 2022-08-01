require './decorator'

class CapitalizeDecorator < Decorator
  # Capitalise the first letter of the given name.
  def correct_name
    @nameable.correct_name.capitalize
  end
end
