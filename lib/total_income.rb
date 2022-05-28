# frozen_string_literal: true

require_relative 'application'

class TotalIncome < Application
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def call
    hash.transform_values { |value| value.transpose.map(&:sum) }
  end
end
