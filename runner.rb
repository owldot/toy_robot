#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

require 'pry'
require_relative 'executor'
require_relative 'placement'
require_relative 'robot'
require_relative 'file_input'


def run
  file_input = FileInput.new(file: ARGV[0])
  file_input.execute
end

def print_usage
  puts "Usage: ./run robot.commands"
end

if ARGV.size < 1
  print_usage
  exit 1
else
  run
end
