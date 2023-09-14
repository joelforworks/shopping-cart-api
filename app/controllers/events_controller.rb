class EventsController < ApplicationController
  def index 
    @events = Event.all
    render json: @events
  end

  def find
    @event = Event.where(:id => params[:id])
    if @event[0]
      render json: @event[0]
    else
      render json: 'Event not found.'
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save 
      render json: @event 
    else
      render json: {error:"Can't create events"} 
    end
  end
  
  private 

  def event_params
    params.require(:event)
      .permit(
        :name,
        :price,
        :thumbnail,
        :description
      )
  end
end
