# frozen_string_literal: true

##
# This class accepts file_name and all classes in order to complete the task.
class Performance
  attr_reader :file, :reader, :data_collector, :counter, :total_income, :printer

  def initialize(file, reader, data_collector, counter, total_income, printer)
    @file = file
    @reader = reader
    @data_collector = data_collector
    @counter = counter
    @total_income = total_income
    @printer = printer
  end

  ##
  # A perform method, that will use all classes and methods in the required order.
  def perform
    valid_file = reader.new(file).call
    collected_data = data_collector.new(valid_file).call
    interim_result = counter.new(collected_data).call
    final_result = total_income.new(interim_result).call
    printer.new(final_result).call
  end
end
