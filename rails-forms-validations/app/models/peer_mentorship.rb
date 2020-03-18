class PeerMentorship < ApplicationRecord
  belongs_to :mentor, class_name: :Student
  belongs_to :peer, class_name: :Student
  # validates :notes, presence: true
  # validates :topic, presence: true
  # validates :meeting_at, presence: true
  validates_presence_of :notes, :topic, :meeting_at
  # validates :topic, uniqueness: true
  validates_uniqueness_of :topic
  validate :meeting_at_cannot_be_in_past
  validate :cant_have_same_peer_and_mentor

  def meeting_at_cannot_be_in_past
    if self.meeting_at < DateTime.now
      self.errors.add(:meeting_at, "date cannot be in the past")
    end
  end

  def cant_have_same_peer_and_mentor
    if peer_id == mentor_id
      self.errors.add(:peer, "cannot be the same as mentor")
    end
  end

end
