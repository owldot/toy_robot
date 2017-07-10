#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

require 'pry'
require_relative 'executor'
require_relative 'placement'
require_relative 'robot'
require_relative 'runner'


def run
  source = File.readlines(ARGV[0])
  runner = Runner.new(source: source)
  runner.execute
end

def print_usage
  puts 'Usage: ./run.rb file_name.extension'
end

if ARGV.size < 1
  print_usage
  exit 1
else
  run
end
