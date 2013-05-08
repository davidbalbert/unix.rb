#!/usr/bin/env ruby

options = {}

if ARGV.include? "-n"
  ARGV.delete "-n"
  options[:lineno] = true
end

if ARGV.include? "-b"
  ARGV.delete "-b"
  options[:non_blank_lineno] = true
end

if options[:lineno] || options[:non_blank_lineno]
  lineno = 1
  argv_size = ARGV.size

  ARGF.each do |line|
    if ARGV.size != argv_size
      argv_size = ARGV.size
      lineno = 1
    end

    if options[:non_blank_lineno] && line == "\n"
      puts
    else
      printf("%6d  %s", lineno, line)
      lineno += 1
    end
  end

else
  ARGF.each { |s| puts s }
end
