class Clown < ApplicationRecord
  validates_presence_of :name, :phrase
end
