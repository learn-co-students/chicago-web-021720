class Author < ActiveRecord::Base
  has_many :chapters
  has_many :books, through: :chapters

  def to_s
    "#{id}: #{name}"
  end
end