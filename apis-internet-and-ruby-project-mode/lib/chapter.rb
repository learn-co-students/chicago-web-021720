class Chapter < ActiveRecord::Base
  belongs_to :book
  belongs_to :author

  def to_s
    <<-CHAPTER_DISPLAY
    ------------------------
    ID: #{self.id}
    Chapter title: #{self.title}
    Written by: #{self.author ? self.author.name : "(anonymous)"} 
    in the book called: #{self.book ? self.book.title : "(TBD)"}
    -------------------------
    CHAPTER_DISPLAY
  end
end