# frozen_string_literal: true

require_relative 'application'

class DataCollector < Application
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    grouping(data)
  end

  private

  def grouping(line)
    hash = Hash.new

    line.split(/\n/).each do |str|
      patient_name, drug_name, event_name = str.split(/\s+/)
      hasherize!(hash, patient_name, drug_name, event_name)
    end

    hash
  end

  def hasherize!(hash, patient_name, drug_name, event_name)
    unless hash[patient_name]
      hash[patient_name] = { drug_name => [event_name] }
    else
      hash[patient_name][drug_name] = hash[patient_name][drug_name] ? hash[patient_name][drug_name] + [event_name] : [event_name]
    end
  end
end
