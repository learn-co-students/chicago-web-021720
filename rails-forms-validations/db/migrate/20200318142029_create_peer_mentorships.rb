class CreatePeerMentorships < ActiveRecord::Migration[5.1]
  def change
    create_table :peer_mentorships do |t|
      t.integer :mentor_id
      t.integer :peer_id
      t.string :topic
      t.datetime :meeting_at
      t.text :notes

      t.timestamps
    end
  end
end
