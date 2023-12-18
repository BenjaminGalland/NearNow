class EventsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    if params[:query]
      @events = Event.global_search(params[:query])
    end

    @tags = Tag.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: }),
        marker_html: render_to_string(partial: "marker", locals: { event: })
      }
    end
  end

  def show
    @markers =
    [
      {
        lat: @event.latitude,
        lng: @event.longitude,
        marker_html: render_to_string(partial: "marker", locals: { event: @event })
      }
    ]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      tags = params[:event][:event_tag_ids]
      tags.shift
      tags.each do |tag|
        event_tag = EventTag.create!(event_id: @event.id, tag_id: tag.to_i)
      end

      participant = Participant.new(user_id: current_user.id, event_id: @event.id)
      participant.save
      chatroom = Chatroom.create!(name: @event.name, event_id: @event.id)
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      EventTag.where(event_id: @event.id).each do |event_tag|
        event_tag.destroy
      end
      tags = params[:event][:event_tag_ids]
      tags.shift
      tags.each do |tag|
        event_tag = EventTag.create!(event_id: @event.id, tag_id: tag.to_i)
      end
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :description, :photo, :address, :public, :max_people, :event_tag_ids)
  end
end
