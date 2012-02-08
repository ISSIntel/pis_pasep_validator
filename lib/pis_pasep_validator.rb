class PisPasepValidator < ActiveModel::EachValidator
  autoload :PisPasep, 'pis_pasep_validator/pis_pasep'

  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message]) unless PisPasep.valid?(value)
  end
end
