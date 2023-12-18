class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @events_created = Event.where(user_id: current_user.id)

    participations = Participant.where(user_id: current_user.id)
    @events = []
    participations.each do |participation|
      @events << Event.find(participation[:event_id])

    end
  end
end
