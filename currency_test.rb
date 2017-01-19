require 'minitest/pride'
require 'minitest/autorun'
require './currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_creation
    Currency.new(code: 'USD', amount: 50)
  end

  def test_equal_currencies
    a = Currency.new(code: 'USD', amount: 50)
    b = Currency.new(code: 'USD', amount: 50)
    assert a == b
  end

  def test_unequal_currencies
    a = Currency.new(code: 'USD', amount: 50)
    b = Currency.new(code: 'USD', amount: 60)
    refute a == b
  end

  def test_add_currencies
    a = Currency.new(code: 'USD', amount: 50)
    b = Currency.new(code: 'USD', amount: 50)
    c = Currency.new(code: 'USD', amount: 100)
    assert a + b == c
  end

  def test_subtract_currencies
    a = Currency.new(code: 'USD', amount: 50)
    b = Currency.new(code: 'USD', amount: 50)
    c = Currency.new(code: 'USD', amount: 0)
    assert a - b == c
  end

  def test_add_subtract_different_currencies
    a = Currency.new(code: 'USD', amount: 0)
    b = Currency.new(code: 'EUR', amount: 0)
    c = Currency.new(code: 'USD', amount: 0)
    refute a + b == c && a - b == c
  end

  def test_multiply_currencies
    a = Currency.new(code: 'USD', amount: 10)
    b = a * 8.8
    assert b.code == a.code && b.amount == a.amount * 8.8
  end
end
