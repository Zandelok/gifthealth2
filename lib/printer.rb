# frozen_string_literal: true

require_relative 'application'

class Printer < Application
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
      prefix = value.last < 0 ? '-' : ''
      p "#{key}: #{value.first} fills #{prefix}$#{value.last.abs} income"
    end
  end
end
