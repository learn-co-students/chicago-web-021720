class PeerMentorshipsController < ApplicationController

  def index
    @peer_mentorships = PeerMentorship.all
  end

  def new
    @students = Student.all
    @peer_mentorship = PeerMentorship.new
  end

  def create
    @peer_mentorship = PeerMentorship.new(peer_mentorship_params)
    if @peer_mentorship.valid?
      @peer_mentorship.save
      redirect_to peer_mentorships_path
    else
      @errors = @peer_mentorship.errors.full_messages
      @students = Student.all
      render :new
    end
  end

  private

  def peer_mentorship_params
    params.require(:peer_mentorship).permit(:mentor_id, :peer_id, :meeting_at, :topic, :notes)
  end
end
