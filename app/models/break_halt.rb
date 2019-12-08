require 'dry/monads/do'

class BreakHalt
  include Dry::Monads[:result]
  include Dry::Monads::Do.for(:call)

  def call()
    yield break_halt
  end

  def break_halt
    Failure('anything')
  end
end
