# frozen_string_literal: true

require_relative 'application'

class Reader < Application
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    if File.exist?(file_path)
      is_empty(File.read(file_path))
    else
      raise StandardError
    end 
  end

  private

  def is_empty(file)
    if file.empty?
      warn "This file is empty"
      exit
    else
      file
    end
  end
end
