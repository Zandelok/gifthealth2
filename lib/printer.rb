# frozen_string_literal: true

class Printer
  attr_reader :hash_of_data

  def initialize(hash_of_data)
    @hash_of_data = hash_of_data
  end

  def call
    printing(hash_of_data)
  end

  private

  def printing(hash)
    hash.each do |key, value|
      value.last < 0 ? negative_value(key, value) : positive_value(key, value)
    end
  end

  def negative_value(key, value)
    p "#{key}: #{value.first} fills -$#{value.last.abs} income"
  end

  def positive_value(key, value)
    p "#{key}: #{value.first} fills $#{value.last} income"
  end
end
