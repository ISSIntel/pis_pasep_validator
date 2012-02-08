require 'rubygems'
require 'test/unit'
require 'active_model'
require 'pis_pasep_validator'
require 'ostruct'

class Person < OpenStruct
  include ActiveModel::Validations
  validates :identification, :pis_pasep => true
end
