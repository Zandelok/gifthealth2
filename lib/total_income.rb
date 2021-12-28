# frozen_string_literal: true

##
# This class count the total values of filled prescriptions and income for each PatientName.
class TotalIncome
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  ##
  # sum all fills and income for each PatientName
  def call
    hash.transform_values { |value| value.transpose.map(&:sum) }
  end
end
