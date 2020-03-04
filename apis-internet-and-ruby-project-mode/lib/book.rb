class Book < ActiveRecord::Base
  has_many :chapters
  has_many :authors, through: :chapters

  def to_s
    "#{id}: #{title}"
  end

  def self.list_all
    puts "Here are our books:"
    puts Book.all
  end
end