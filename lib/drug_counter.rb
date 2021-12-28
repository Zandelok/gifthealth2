# frozen_string_literal: true

##
# This class count the total values of filled prescriptions and income for each DrugName.
class DrugCounter
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def call
    count_values(hash)
  end

  private

  ##
  # transform value(DrugName => EventName) into array for each DrugName: filled and income.
  def count_values(hash_of_data)
    hash_of_data.transform_values { |drug_name| counting(drug_name).values }
  end

  def counting(drug_name)
    drug_name.transform_values do |value|
      profit = profit_setter(value)
      filled = filled_setter(profit)
      total_count(profit, filled)
    end
  end

  ##
  # select all events after created.
  def profit_setter(value)
    value.drop_while { |event| event != "created" }
  end

  ##
  # counting the number of filled DrugName (Every returned cancels out a prior filled event).
  def filled_setter(profit)
    profit.count('filled') - profit.count('returned')
  end

  ##
  # count income for DrugName and make array: count of filled and income.
  def total_count(profit, filled)
    [filled, (filled * 5 - profit.count('returned'))]
  end
end
