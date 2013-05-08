#!/usr/bin/env ruby

options = {}

if ARGV.include? "-a"
  ARGV.delete("-a")
  options[:show_all] = true
end

if ARGV.size > 0
  files, bad = ARGV.partition { |filename| File.exists?(filename) }
  bad.each { |filename| STDERR.puts "#{$0}: #{filename}: No such file or directory" }
else
  glob_string = options[:show_all] ? "{.*,*}" : "*"

  files = Dir[glob_string]
end

files.each { |file| puts file }
