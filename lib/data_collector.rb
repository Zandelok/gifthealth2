# frozen_string_literal: true

##
# This class read each line of the file and group it 
# in the following form: PatientName => { DrugName => EventName }.

class DataCollector
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
      ##
      # place each column in the required array and
      # call hasherize! method to make a hash.
      patient_name, drug_name, event_name = str.split(/\s+/)
      hasherize!(hash, patient_name, drug_name, event_name)
    end

    hash
  end

  ##
  # group data in the following form: PatientName => { DrugName => EventName }.
  def hasherize!(hash, patient_name, drug_name, event_name)
    unless hash[patient_name]
      hash[patient_name] = { drug_name => [event_name] }
    else
      ##
      # push to or create array of events.
      hash[patient_name][drug_name] = hash[patient_name][drug_name] ? hash[patient_name][drug_name] + [event_name] : [event_name]
    end
  end
end
