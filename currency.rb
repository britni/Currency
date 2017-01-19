class Currency
  attr_reader :code, :amount

  def initialize(code:, amount:)
    @code = code
    @amount = amount
  end

  def ==(other)
    @code == other.code && @amount == other.amount
  end

  def +(other)
    raise DifferentCurrencyCodeError, 'err' if @code != other.code
    @code == other.code
    total = @amount + other.amount
    currency = Currency.new(code: @code, amount:total)
  end

  def -(other)
    raise DifferentCurrencyCodeError, 'err' if @code != other.code
    @code == other.code
    difference = other.amount - @amount
    currency = Currency.new(code: @code, amount:difference)
  end

  def *(value)
    product = @amount * value.to_f
    currency = Currency.new(code: @code, amount:product)
  end
end

class DifferentCurrencyCodeError < Exception
end
