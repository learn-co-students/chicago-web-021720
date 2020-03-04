def clear_screen
  puts "\e[H\e[2J"
end

def handle_chapter_creation
  
  puts Book.all
  puts "----"
  puts "YAY, LET'S WRITE A CHAPTER!"
  puts "please type an id from the above Book list:"
  book = Book.find_by(id: gets.chomp.to_i)

  puts Author.all
  puts "please type a name from the above Author list. please pay attention to detail as you type!"
  author = Author.find_by("name LIKE '#{gets.chomp}'")

  while author == nil
    clear_screen
    puts Author.all
    puts "not found, please try again! type a name from the above Author list. please pay CLOSE attention to detail as you type!"
    author = Author.find_by("name LIKE '#{gets.chomp}'")
  end


  puts "Finally, name your chapter!"
  title = gets.chomp

  chapter = Chapter.create(title: title, book: book, author: author)

  puts "You've added a chapter by #{chapter.author.name} to the book called #{chapter.book.title}! Called it #{chapter.title} and everything too! Nice!"
end

def pause_until_enter_press
  puts "Please press enter to continue"
  # Pause til user presses enter
  gets
  clear_screen
end

def display_main_options
  puts "What do you want to do? Please select a number from below. At any time type 'exit' to quit."
  puts "1: View all books"
  puts "2: Create a new chapter"
  puts "3: Edit existing chapter"
end

def handle_chapter_edit
  puts Chapter.all
  puts "-----"
  puts "please enter the ID of the chapter you wish to edit:"
  chapter_id = gets.chomp.to_i

  chapter = Chapter.find_by(id: chapter_id)

  clear_screen
  puts chapter

  puts "please give this chapter a new title:"
  new_title = gets.chomp

  # chapter.update(title: new_title) is the same as the next 2 lines
  chapter.assign_attributes(title: new_title)
  chapter.save

  clear_screen
  puts "Updated! New chapter info is:"
  puts chapter
end