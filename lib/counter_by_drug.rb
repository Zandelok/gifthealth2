# frozen_string_literal: true

class CounterByDrug
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def call
    count_values(hash)
  end

  private

  def count_values(hash_of_data)
    hash_of_data.transform_values { |drug_name| counting(drug_name).values }
  end

  def counting(drug_name)
    drug_name.transform_values { |value| value.include?("created") ? value_counting(value) : [0, 0] }
  end

  def value_counting(value)
    profit = profit_setter(value)
    filled = filled_setter(profit)
    total_count(profit, filled)
  end

  def profit_setter(value)
    value.drop_while { |event| event != "created" }
  end

  def filled_setter(profit)
    profit.count('filled') - profit.count('returned')
  end

  def total_count(profit, filled)
    [filled, (filled * 5 - profit.count('returned'))]
  end
end
