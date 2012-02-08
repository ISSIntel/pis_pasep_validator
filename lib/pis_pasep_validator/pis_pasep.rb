class PisPasepValidator::PisPasep
  def self.valid?(number)
    new(number).valid?
  end

  attr_reader :number

  def initialize(number)
    @number = number.to_s
  end

  def digits
    @digits ||= number.scan(/\d/).map(&:to_i)
  end

  def plain
    @plain ||= digits.join
  end

  def digit_verificator
    digits[-1]
  end

  def valid?
    formatted? && !black_listed? && digits_matches?
  end

  private

  def formatted?
    plain =~ /^\d{11}$/ || number =~ /^\d{3}\.\d{5}\.\d{2}-\d{1}$/
  end

  def black_listed?
    plain =~ /^12345678909|(\d)\1{10}$/
  end

  def digits_matches?
    sum = 0
    coefficient = 2

    (digits.size - 2).downto(0).each do |i|
      sum += digits[i] * coefficient
      coefficient += 1
      coefficient = 2 if coefficient > 9
    end

    result = sum % 11
    result = 11 - result

    result = 0 if result >= 10
    result == digit_verificator
  end
end
