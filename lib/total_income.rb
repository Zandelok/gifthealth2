# frozen_string_literal: true

class TotalIncome
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def total
    hash.transform_values { |value| value.transpose.map(&:sum) }
  end
end
