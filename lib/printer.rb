# frozen_string_literal: true

##
# This class output the received data in accordance with the requirements.
class Printer
  attr_reader :hash_of_data

  def initialize(hash_of_data)
    @hash_of_data = hash_of_data
  end

  def call
    printing(hash_of_data)
  end

  private

  ##
  # print PatientName, total fills and income.
  #  Income output differs depending on whether a negative or positive amount has been received.
  def printing(hash)
    hash.each do |key, value|
      p "#{key}: #{value.first} fills #{value.last < 0 ? "-$#{value.last.abs}" : "$#{value.last}"} income"
    end
  end
end
