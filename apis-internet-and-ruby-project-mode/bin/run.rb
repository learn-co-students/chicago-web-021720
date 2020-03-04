require_relative '../config/environment'
require_relative "cli_methods"
ActiveRecord::Base.logger = nil

clear_screen
puts "******WELCOME TO BOOKISHLY******"

display_main_options
user_option = gets.chomp

while user_option != "exit"
  clear_screen
  if user_option == "1"
    Book.list_all
  elsif user_option == "2"
    handle_chapter_creation
  elsif user_option == "3"
    handle_chapter_edit
  end
  pause_until_enter_press

  display_main_options
  user_option = gets.chomp
end

puts "***********Thanks for using Bookishly!***********"