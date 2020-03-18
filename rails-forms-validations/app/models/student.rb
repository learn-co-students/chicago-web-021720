class Student < ApplicationRecord
  belongs_to :cohort
  has_many :mentoring_sessions, class_name: :PeerMentorship, foreign_key: :mentor_id
  has_many :helped_peers, through: :mentoring_sessions, source: :peer
  
  has_many :learning_sessions, class_name: :PeerMentorship, foreign_key: :peer_id
  has_many :mentors, through: :learning_sessions
end
