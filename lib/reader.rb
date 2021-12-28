# frozen_string_literal: true

##
# This class check if the file exists, and if so, read it.
class Reader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  ##
  # check file: empty or not or raise error if file doesn't exist.
  def call
    if File.exist?(file_path)
      is_empty(File.read(file_path))
    else
      raise StandardError
    end 
  end

  private

  ##
  # finish program if file is empty or return read file.
  def is_empty(file)
    if file.empty?
      warn "This file is empty"
      exit(1)
    else
      file
    end
  end
end
