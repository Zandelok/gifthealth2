# frozen_string_literal: true

class Reader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def file_read
    if File.exist?(file_path)
      File.read(file_path)
    else
      raise StandardError
    end 
  end
end
