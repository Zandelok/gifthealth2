# frozen_string_literal: true

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

  def perform
    valid_file = reader.new(file).file_read
    collected_data = data_collector.new(valid_file).call
    interim_result = counter.new(collected_data).call
    final_result = total_income.new(interim_result).total
    printer.new(final_result).call
  end
end
