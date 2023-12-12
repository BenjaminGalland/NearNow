class ParticipantsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  def create
    participant = Participant.new(user_id: current_user.id, event_id: @event.id)
    if participant.save
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    participant = Participant.where(user_id: current_user.id, event_id: @event.id)[0]
    if participant.destroy
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
