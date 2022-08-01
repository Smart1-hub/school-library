require './decorator'

class TrimmerDecorate < Decorator
  def correct_name
    @decorate.correct_name.upcase[0...10]
  end
end
