require 'pry'
require_relative 'scraper.rb'
require_relative '../config/environment.rb'
 
def run 
  welcome
  help
  command
end

def welcome
  puts ""
  puts "Welcome to The 007-Ruby Student Directory"
  puts "Stalk at will..."
  puts ""
end

def help
  puts "These are the possible commands"
  puts "-help  :  displays this help menu"
  puts "-list names :  displays the list of student names"
  puts "-profile  :  displays information for a specific student"
  puts "-exit  :  exits this program"
end

def command
  puts "Please enter a command"
  input = gets.downcase.strip 
  case input
  when "exit"
    exit
  when "help"
    help
  when "list names"
    list_names
    command
  when "profile"
    profile
    command
  else
    puts "Please enter a valid command"
    command
  end
end

def exit
  abort("Goodbye!!!")
end

def list_names
  get_student_names.each.with_index(1) do |name, i|
    puts "#{i}. #{name}"
  end
end

def profile
  puts "Please wait. Fetching students..."
  students = create_student_hash
  list_names
  puts "Enter a student index."
  student_index = gets.strip.to_i - 1
  puts "Name: #{students[student_index][:name]}"
  puts ""
  puts "Bio:\n#{students[student_index][:bio]}"
  puts ""
  puts "Education:\n#{students[student_index][:education]}"
  puts ""
  puts "Work:\n#{students[student_index][:work]}"
  puts ""
  puts "Coder Cred:\n#{students[student_index][:coder_cred]}"
  puts ""
end

run





