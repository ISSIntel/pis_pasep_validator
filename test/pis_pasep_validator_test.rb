require 'test_helper'

class PisPasepValidatorTest < Test::Unit::TestCase

  def test_black_list
    %w(11111111111 22222222222 77777777777).each do |number|
      assert_invalid number
    end
  end

  def test_invalid
    assert_invalid '099075865'
    assert_invalid '123.4567.891-3'
    assert_invalid '09907586561'
    assert_invalid '234.624.576-57'
  end

  def test_blank_values
    assert_invalid ''
    assert_invalid false
    assert_invalid nil
  end

  def test_masked
    assert_valid '107.63096.72-2'
    assert_valid '123.45678.91-9'
  end

  def test_unmasked
    assert_valid '12345678919'
    assert_valid '10763096722'
  end

  protected

  def assert_invalid(identification)
    assert person(:identification => identification).invalid?
  end

  def assert_valid(identification)
    assert person(:identification => identification).valid?
  end

  def person(attributes = {})
    Person.new(attributes)
  end
end
