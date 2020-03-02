class Book < ActiveRecord::Base

  def to_s
    "#{id}: #{title} - by #{authors}"
  end
end