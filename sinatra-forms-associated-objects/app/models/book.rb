class Book < ActiveRecord::Base
  belongs_to :author
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :snippet, presence: true
  validates :author_id, presence: true
end
