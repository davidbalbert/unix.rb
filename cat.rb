#!/usr/bin/env ruby

if ARGV.include? "-n"
  ARGV.delete "-n"

  lineno = 1
  argv_size = ARGV.size

  ARGF.each do |line|
    if ARGV.size != argv_size
      argv_size = ARGV.size
      lineno = 1
    else
      lineno += 1
    end
    printf("%6d  %s", lineno, line)
  end

else
  ARGF.each { |s| puts s }
end
