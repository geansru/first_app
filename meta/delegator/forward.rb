require 'forwardable'

require 'delegate'
class Car
  attr_reader :price
  def initialize price
    @price = price
  end
end

class VATCalc < SimpleDelegator
  def calc
    price * 1.23
  end
end

