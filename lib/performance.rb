# frozen_string_literal: true

require_relative 'application'

class Performance < Application
  attr_reader :file, :reader, :data_collector, :counter, :total_income, :printer

  def initialize(file, reader, data_collector, counter, total_income, printer)
    @file = file
    @reader = reader
    @data_collector = data_collector
    @counter = counter
    @total_income = total_income
    @printer = printer
  end

  def call
    valid_file = reader.call(file)
    collected_data = data_collector.call(valid_file)
    interim_result = counter.call(collected_data)
    final_result = total_income.call(interim_result)
    printer.call(final_result)
  end
end
